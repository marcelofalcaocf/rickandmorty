//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 13/03/23.
//

import Foundation

struct CharacterModel: Codable, Equatable {
    let id: Int
    let name: String
    let species: String
    let gender: String
    let status: String
    let image: String
    let created: String
}
