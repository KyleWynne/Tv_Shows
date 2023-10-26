//
//  ShowData.swift
//  Tv_Shows
//
//  Created by Kyle Wynne on 10/23/23.
//

import Foundation

import Foundation
import UIKit
import SwiftUI

var ShowData: [Show] = loadJson("ShowData.json")
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
