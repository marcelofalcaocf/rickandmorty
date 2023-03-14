//
//  HomeViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Marcelo Falcao Costa Filho on 13/03/23.
//

import XCTest
@testable import RickAndMorty

final class HomeViewModelTests: XCTestCase {
    
    var homeViewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        homeViewModel = HomeViewModel()
    }

    override func tearDown() {
        homeViewModel = nil
        super.tearDown()
    }
      
      func testCharactersCount() {
          homeViewModel.characters = [
            CharacterModel(id: 1,
                           name: "Marcelo",
                           species: "Human",
                           gender: "Male",
                           status: "Alive",
                           image: "https://mixdeseries.com.br/wp-content/uploads/2021/08/Rick-and-Morty-5-temporada.webp",
                           created: "01/12/2020"),
            CharacterModel(id: 12,
                           name: "Carlos",
                           species: "Human",
                           gender: "Male",
                           status: "Alive",
                           image: "https://mixdeseries.com.br/wp-content/uploads/2021/08/Rick-and-Morty-5-temporada.webp",
                           created: "02/12/2020"),
            CharacterModel(id: 12,
                           name: "Eduardo",
                           species: "Human",
                           gender: "Male",
                           status: "Alive",
                           image: "https://mixdeseries.com.br/wp-content/uploads/2021/08/Rick-and-Morty-5-temporada.webp",
                           created: "03/12/2020")]
          
          let exp: Int = 3
          
          XCTAssertEqual(homeViewModel.charactersCount(), exp)
      }
      
      func testConfigCellWithCharacters() {
          let personOne = CharacterModel(id: 12, name: "Test", species: "Test", gender: "Test", status: "Test", image: "tEST", created: "Test")
          let personTwo = CharacterModel(id: 14, name: "Test", species: "Test", gender: "Test", status: "Test", image: "tEST", created: "Test")
          homeViewModel.characters = [personOne, personTwo]
          
          XCTAssertEqual(homeViewModel.configCellWithCharacters(position: 0), personOne)
          XCTAssertEqual(homeViewModel.configCellWithCharacters(position: 1), personTwo)
      }
  }
