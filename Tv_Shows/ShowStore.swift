//
//  ShowStore.swift
//  Tv_Shows
//
//  Created by Kyle Wynne on 10/23/23.
//

import Foundation
import SwiftUI
import Combine

class ShowStore : ObservableObject {
    @Published var shows: [Show]
    init (shows: [Show] = []) {
        self.shows = shows
    }
}
