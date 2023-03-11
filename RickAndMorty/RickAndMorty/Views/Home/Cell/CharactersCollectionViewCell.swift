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
        view.layer.shadowColor = UIColor(red: 42/255, green: 99/255, blue: 241/255, alpha: 1).cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photoView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "Green-Hole")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "teste"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ethnicGroupLabel: UILabel = {
        let label = UILabel()
        label.text = "teste"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        photoView.image = nil
        titleLabel.text = nil
        ethnicGroupLabel.text = nil
    }
    
    private func addSubViews() {
        cardView.addSubview(photoView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(ethnicGroupLabel)
        contentView.addSubview(cardView)
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
            ethnicGroupLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12)
        ])
    }
}
