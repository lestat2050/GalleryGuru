//
//  Exhibition.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/8/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

class Exhibition {
 
    let id: String
    let authorName: String?
    let gallery: Gallery?
    let name: String
    let authorDescription: String?
    let dateStart: Date?
    let about: String?
    let dataEnd: Date?
    let works: [Work]
    let likesCount: Int
    
    init(id: String, authorName: String?, gallery: Gallery?, name: String,
         authorDescription: String? = nil, dateStart: Date?, about: String?,
         dataEnd: Date?, works: [Work] = [], likesCount: Int = 0) {
        self.id = id
        self.authorName = authorName
        self.gallery = gallery
        self.name = name
        self.authorDescription = authorDescription
        self.dateStart = dateStart
        self.about = about
        self.dataEnd = dataEnd
        self.works = works
        self.likesCount = likesCount
    }
    
}

extension Exhibition: ExhibitionProtocol { }
