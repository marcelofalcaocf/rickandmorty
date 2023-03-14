//
//  DetailScreen.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 11/03/23.
//

import UIKit

final class DetailScreen: UIView {
    
    private lazy var profileImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor(red: 3/255, green: 96/255, blue: 11/255, alpha: 1).cgColor
        view.layer.cornerRadius = 60
        return view
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor(red: 0/255, green: 255/255, blue: 10/255, alpha: 1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 188/255, green: 255/255, blue: 76/255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
//        label.text = "status: ALIVE"
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var createdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, genderLabel, speciesLabel, statusLabel, createdLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public func updateElements(characters: CharacterModel) {
        nameLabel.text = characters.name
        profileImageView.from(url: characters.image)
        genderLabel.text = "gender \(characters.gender)"
        speciesLabel.text = "species \(characters.species)"
        statusLabel.text = "status: \(characters.status)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = dateFormatter.date(from: "2017-11-04T19:50:28.250Z") {
            dateFormatter.dateFormat = "yyyy/MM/dd"
            let formattedDate = dateFormatter.string(from: date)
            createdLabel.text = "created: \(formattedDate)"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailScreen: ViewCodable {
    func setupConfigurations() {
        addBackground(named: "Background-4")
    }
    
    func setupHierarchy() {
        cardView.addSubview(nameLabel)
        cardView.addSubview(stackView)
        addSubview(cardView)
        addSubview(profileImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            cardView.heightAnchor.constraint(equalToConstant: 191),
            
            nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -40),
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 13),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 75),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -75),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -35),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: cardView.topAnchor, constant: 25)
        ])
    }
}
