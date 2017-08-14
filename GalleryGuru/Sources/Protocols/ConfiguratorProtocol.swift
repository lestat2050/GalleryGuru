//
//  ConfiguratorProtocol.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/12/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

protocol ConfigurableCell  {
    static var identifier: String { get }
}

protocol ExhibitionProtocol {
    var id: String { get }
}

protocol ConfiguratorProtocol {
    var cellIdentifier: String { get }
    
    func configure(with cell: ConfigurableCell, model: ExhibitionProtocol)
}
