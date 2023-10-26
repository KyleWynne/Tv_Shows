//
//  ShowDetail.swift
//  Tv_Shows
//
//  Created by Kyle Wynne on 10/23/23.
//

import Foundation
import SwiftUI

struct ShowDetail: View {
    let selectedShow: Show
    var body: some View {
        Form {
            Section(header: Text("Show Details")) {
                Image(selectedShow.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    //.padding()
                
                Text("Title: \(selectedShow.name)")
                    .font(.headline)
                
                Text("Description: \(selectedShow.description)")
                    .font(.body)
                
                Text("Rating: \(selectedShow.rating)")
                    .font(.body)
            }
        }
    }
}
struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetail(selectedShow: ShowData[0])
    }
}
