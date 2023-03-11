//
//  DetailScreen.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 11/03/23.
//

import UIKit

final class DetailScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addBackground(named: "Background-3")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
