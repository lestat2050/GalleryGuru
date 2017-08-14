//
//  LoadingViewController.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/12/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    let loader = DataLoader()
    var exhibitions: [Exhibition] = [] {
        didSet {
            showExhibition()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exhibitions = loader.loadExhibition()
    }
    
    func showExhibition() {
        guard let nc = navigationController else {
            fatalError("No Navigation Controller")
        }
        guard let exhibitionVC = storyboard?.instantiateViewController(withIdentifier:
            "ExhibitionViewController") as? ExhibitionViewController else {
                fatalError("No such vc ident exhibi")
        }
        exhibitionVC.exhibitions = exhibitions
        nc.setViewControllers([exhibitionVC], animated: true)
    }

}
