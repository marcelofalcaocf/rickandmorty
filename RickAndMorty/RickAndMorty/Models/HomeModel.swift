//
//  HomeModel.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 13/03/23.
//

import Foundation

struct HomeModel: Codable {
    let info: InfoCharactersModel
    let results: [CharacterModel]
}
