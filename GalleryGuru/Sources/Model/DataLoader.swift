//
//  DataLoader.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/8/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

class DataLoader {
    
    var galleries: [String: Gallery] = [:]
    //var works: [Work] = []
    var works: [String: Work] = [:]
    
    func loadWork() -> [String: Work] {
        guard let url = Bundle.main.url(forResource: "works",
                                        withExtension: "json") else {
                                            fatalError("No such file")
        }
        
        guard let workRawData = try? Data(contentsOf: url) else {
            fatalError("Can't read data")
        }
        
        guard let worksRawArray = try! JSONSerialization.jsonObject(with:
            workRawData) as? [[String: Any]] else {
                fatalError("Wrong json format")
        }
        
        worksRawArray.forEach {
            let workID = $0["_id"] as! String
            let work = Work(id: workID,
                            size: $0["size"] as? String,
                            title: $0["title"] as? String,
                            imgPicture: $0["imgPicture"] as? String,
                            type: $0["type"] as? String,
                            author: $0["author"] as? String,
                            galleryDescription: $0["schedule"] as? String,
                            year: $0["year"] as? String)
            
            works[workID] = work
        }
        
//        works = worksRawArray.map {
//            return Work(id: $0["_id"] as! String,
//                           size: $0["size"] as? String,
//                           title: $0["title"] as? String,
//                           imgPicture: $0["imgPicture"] as? String,
//                           type: $0["type"] as? String,
//                           author: $0["author"] as? String,
//                           galleryDescription: $0["schedule"] as? String,
//                           year: $0["year"] as? String)
//        }
        
        print("worksRawArray: \(works)")
        
        return works
    }
    
    func loadGallery() -> [String: Gallery] {
        guard let url = Bundle.main.url(forResource: "galleries",
                                        withExtension: "json") else {
                                            fatalError("No such file")
        }
        
        guard let galleryRawData = try? Data(contentsOf: url) else {
            fatalError("Can't read data")
        }
        
        guard let galleriesRawArray = try! JSONSerialization.jsonObject(with:
            galleryRawData) as? [[String: Any]] else {
                fatalError("Wrong json format")
        }
        
        galleriesRawArray.forEach {
            let galleryID = $0["_id"] as! String
            let gallery = Gallery(id: galleryID,
                           name: $0["name"] as! String,
                           galleryDescription: $0["galleryDescription"] as? String,
                           email: $0["email"] as? String,
                           facebook: $0["facebook"] as? String,
                           city: $0["city"] as? String,
                           schedule: $0["schedule"] as? [String],
                           address: $0["address"] as? String,
                           galleryLogo: $0["galleryLogo"] as? String,
                           link: $0["link"] as? String,
                           phone: $0["phone"] as? String,
                           latitude: $0["latitude"] as? String,
                           longitude: $0["longitude"] as? String)
            
            galleries[galleryID] = gallery
        }
    
        print("galleriesRawArray: \(galleries)")
        
        return galleries
    }
    
    func loadExhibition() -> [Exhibition] {
        
        works = loadWork()
        galleries = loadGallery()

        var exhibitions: [Exhibition] = []
        guard let url = Bundle.main.url(forResource: "exhibitions",
                                        withExtension: "json") else {
                                            fatalError("No such file")
        }
        
        guard let exhibitionRawData = try? Data(contentsOf: url) else {
            fatalError("Can't read data")
        }
        
        guard let exhibitionsRawArray = try! JSONSerialization.jsonObject(with:
            exhibitionRawData) as? [[String: Any]] else {
            fatalError("Wrong json format")
        }
        
        exhibitions = exhibitionsRawArray.map {
        
            let galleryRawID = $0["_p_gallery"] as! String
            let galleryID = galleryRawID.replacingOccurrences(of: "Gallery$", with: "")
            
            
            
        return Exhibition(id: $0["_id"] as! String,
                          authorName: $0["authorName"] as? String,
                          gallery: galleries[galleryID],
                          name: $0["name"] as! String,
                          authorDescription: $0["authorDescription"] as? String,
                          dateStart: Date.from(dateString: $0["dateStart"] as? String),
                          about: $0["authorName"] as? String,
                          dataEnd: Date.from(dateString: $0["dataEnd"] as? String),
                          works: [],
                          likesCount: $0["likesCount"] as? Int ?? 0)
        }
        
        print("exhibitionRawArray: \(exhibitions)")
            
        return exhibitions
    }
    
}

extension Date {

    static func from(dateString: String?) -> Date? {
        guard let dateString = dateString else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss'Z'"
        return dateFormatter.date(from: dateString)
    }
    
}
