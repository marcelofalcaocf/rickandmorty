//
//  CharactersCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 11/03/23.
//

import UIKit

final class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CharactersCollectionViewCell"
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photoView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 188/255, green: 255/255, blue: 76/255, alpha: 1)
        label.font = UIFont(name: "Avenir", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ethnicGroupLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Avenir", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        photoView.image = nil
        titleLabel.text = nil
        ethnicGroupLabel.text = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        cardView.addSubview(photoView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(ethnicGroupLabel)
        contentView.addSubview(cardView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.shadowColor = UIColor(red: 0/255, green: 255/255, blue: 10/255, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
        layer.masksToBounds = false
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    func setupCell(characters: CharacterModel) {
        titleLabel.text = characters.name
        ethnicGroupLabel.text = characters.species
        photoView.from(url: characters.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: cardView.topAnchor),
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoView.heightAnchor.constraint(equalToConstant: 93),
            
            titleLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 15),
            
            ethnicGroupLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            ethnicGroupLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            ethnicGroupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            ethnicGroupLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12),
            
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
