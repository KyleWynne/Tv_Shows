//
//  AddNewShow.swift
//  Tv_Shows
//
//  Created by Kyle Wynne on 10/23/23.
//

import Foundation

import SwiftUI

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct AddNewShow: View {
    @StateObject var ShowStore : ShowStore
    @State private var rating: String = ""
    @State private var name: String = ""
    @State private var description: String = ""
    var body: some View {
        Form {
            Section(header: Text("Show Details")) {
                Image(systemName: "show.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                DataInput(title: "Rating", userInput: $rating)
            }
            Button(action: addNewShow) {
                Text("Add Show")
            }
        }
    }
    func addNewShow() {
        let newShow = Show(id: UUID().uuidString,
                         name: name, description: description,
                           rating: rating, imageName: "default" )
        ShowStore.shows.append(newShow)
    }
}

struct AddNewShow_Previews: PreviewProvider {
    static var previews: some View {
        AddNewShow(ShowStore: ShowStore(shows: ShowData))
    }
}
