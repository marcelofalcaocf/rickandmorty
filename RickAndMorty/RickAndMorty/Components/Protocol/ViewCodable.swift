//
//  ViewCodable.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 14/03/23.
//

import Foundation

protocol ViewCodable {
    func setupView()
    func setupConfigurations()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCodable {
    func setupView() {
        setupConfigurations()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupConfigurations() {}
}
