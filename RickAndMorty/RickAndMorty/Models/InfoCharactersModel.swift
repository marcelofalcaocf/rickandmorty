//
//  InfoCharactersModel.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 13/03/23.
//

import Foundation

struct InfoCharactersModel: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}
