//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Marcelo Falcao Costa Filho on 11/03/23.
//

import UIKit

final class DetailViewController: UIViewController {
    
    lazy var viewScreen: DetailScreen = .init()
    
    override func loadView() {
        self.view = viewScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addLogoToNavigationBarItem()
        
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
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
