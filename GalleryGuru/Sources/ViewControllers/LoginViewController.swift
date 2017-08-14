//
//  LoginViewController.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/8/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var previewImagesPageController: UIPageControl!
    @IBOutlet weak var previewScreenCollectionView: UICollectionView! {
        didSet {
            previewScreenCollectionView.dataSource = self
            previewScreenCollectionView.delegate = self
        }
    }
    let previewScreenImages = ["previewScreen1", "previewScreen2", "previewScreen3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension LoginViewController: UICollectionViewDelegate { }

extension LoginViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return previewScreenImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            PreviewScreenCell.identifier, for: indexPath) as! PreviewScreenCell
        cell.previewImage.image = UIImage(named: previewScreenImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        self.previewImagesPageController.currentPage = indexPath.row
    }
    
}
