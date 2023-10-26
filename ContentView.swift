//
//  ContentView.swift
//  Tv_Shows
//
//  Created by Kyle Wynne on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var showStore : ShowStore = ShowStore(shows: ShowData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach (showStore.shows) { Show in
                    NavigationLink(destination: ShowDetail(selectedShow: Show)) {
                        HStack {
                            Image(Show.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 60)
                            Text(Show.name)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("Show List"))
            .navigationBarItems(leading: NavigationLink(destination:
                                                            AddNewShow(ShowStore: self.showStore)) {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
        func deleteItems(at offsets: IndexSet) {
        showStore.shows.remove(atOffsets: offsets)
    }
        func moveItems(from source: IndexSet, to destination: Int) {
        showStore.shows.move(fromOffsets: source, toOffset: destination)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

