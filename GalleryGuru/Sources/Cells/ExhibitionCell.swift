//
//  ExhibitionCell.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/12/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import UIKit

class ExhibitionCell: UITableViewCell {

    @IBOutlet weak var exhibitionImage: UIImageView!
    @IBOutlet weak var galleryNameLabel: UILabel!
    @IBOutlet weak var exhibitionNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    static let identifier: String = String(describing: ExhibitionCell.self)
    
}

extension ExhibitionCell: ConfigurableCell { }
