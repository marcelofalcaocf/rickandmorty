//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 11/03/23.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    func actionBackView()
}

final class DetailViewController: UIViewController {
    
    var delegate: DetailViewControllerProtocol?
    
    private let viewModel: DetailViewModel
    lazy var viewScreen: DetailScreen = .init()
    
    init(characters: CharacterModel) {
        self.viewModel = DetailViewModel(characters: characters)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        self.view = viewScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addLogoToNavigationBarItem()
        configNavigationBar()
        viewScreen.updateElements(characters: viewModel.characters)
        
        UIView.animate(withDuration: 1.0) {
            self.viewScreen.frame.origin.x += 100
        }
    }
    
    private func configNavigationBar() {
        let backButton = UIBarButtonItem(
            image: UIImage(named: "arrowBlack"),
            style: .plain,
            target: self,
            action: #selector(didTapBack)
        )
        backButton.tintColor = UIColor(red: 189/255, green: 255/255, blue: 161/255, alpha: 1)
        navigationItem.setLeftBarButton(backButton, animated: true)
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
        delegate?.actionBackView()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
