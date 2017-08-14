//
//  Gallery.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/8/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

class Gallery {
    
    let id: String
    let name: String
    let galleryDescription: String?
    let email: String?
    let facebook: String?
    let city: String?
    let schedule: [String]?
    let address: String?
    let galleryLogo: String?
    let link: String?
    let phone: String?
    let latitude: String?
    let longitude: String?
    
    init(id: String, name: String, galleryDescription: String?, email: String?,
         facebook: String?, city: String?, schedule: [String]?, address: String?,
         galleryLogo: String?, link: String?, phone: String?, latitude: String?,
         longitude: String?) {
        self.id = id
        self.name = name
        self.galleryDescription = galleryDescription
        self.email = email
        self.facebook = facebook
        self.city = city
        self.schedule = schedule
        self.address = address
        self.galleryLogo = galleryLogo
        self.link = link
        self.phone = phone
        self.latitude = latitude
        self.longitude = longitude
    }
}
