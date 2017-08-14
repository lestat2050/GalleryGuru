//
//  Work.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/8/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

class Work {

    let id: String
    let size: String?
    let title: String?
    let imgPicture: String?
    let type: String?
    let author: String?
    let galleryDescription: String?
    let year: String?
    
    init(id: String, size: String?, title: String?, imgPicture: String?,
         type: String?, author: String?, galleryDescription: String?, year: String?) {
        self.id = id
        self.size = size
        self.title = title
        self.imgPicture = imgPicture
        self.type = type
        self.author = author
        self.galleryDescription = galleryDescription
        self.year = year
    }
    
}
