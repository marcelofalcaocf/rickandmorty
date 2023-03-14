//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 13/03/23.
//

import Foundation

protocol HomeViewModelProtocol {
    func updateCharacters()
}

final class HomeViewModel {
    
    private var service: HomeServiceType = HomeService()
    private var characters = [CharacterModel]()
    var delegate: HomeViewModelProtocol?
    
    func receiveDate() {
        service.accessAllCharacters { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let success):
                self.characters = success.results
                self.delegate?.updateCharacters()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func charactersCount() -> Int {
        return characters.count
    }
    
    func configCellWithCharacters(position: Int) -> CharacterModel {
        return characters[position]
    }
}
