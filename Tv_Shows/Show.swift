//
//  Show.swift
//  Tv_Shows
//
//  Created by Kyle Wynne on 10/23/23.
//

import Foundation
import SwiftUI

struct Show : Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var rating: String
    var imageName: String
}
