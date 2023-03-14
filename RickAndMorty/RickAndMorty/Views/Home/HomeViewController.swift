//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 11/03/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    lazy var viewScreen: HomeScreen = .init()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavigationBarItem()
        viewScreen.configProtocolsCollectionView(delegate: self, dataSouce: self)
        
        viewModel.receiveDate()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.charactersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell {
            cell.setupCell(characters: viewModel.configCellWithCharacters(position: indexPath.item))
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 127, height: 141)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc: DetailViewController = .init(characters: viewModel.configCellWithCharacters(position: indexPath.item))
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func updateCharacters() {
        DispatchQueue.main.async {
            self.viewScreen.collectionView.reloadData()
        }
    }
}

extension HomeViewController: DetailViewControllerProtocol {
    func actionBackView() {
        UIView.animate(withDuration: 1.0) {
            self.viewScreen.frame.origin.x -= 100
        }
    }
}
