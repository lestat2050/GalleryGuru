//
//  ExhibitionCellConfigurator.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/12/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

class ExhibitionCellConfigurator {
    
    let cellIdentifier = ExhibitionCell.identifier
    
    func configure(with cell: ConfigurableCell, model: ExhibitionProtocol) {
        guard let cell = cell as? ExhibitionCell else {
            fatalError("Not right view")
        }
        guard let model = model as? Exhibition else {
            fatalError("Not right model")
        }
        //cell.exhibitionImage.image = model.
        //cell.galleryNameLabel.text = model.name
        cell.exhibitionNameLabel.text = model.name
        cell.authorNameLabel.text = model.authorName
        
    }
    
}

extension ExhibitionCellConfigurator: ConfiguratorProtocol { }



