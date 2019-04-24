//
//  WebImagesModal.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/23/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import Foundation
import UIKit

struct WebImagesModal:  Codable {
    var total_pages : Int!
    var results : [Results]?
}

struct Results: Codable {
    var published_at : String?
    var user : user?
    var preview_photos : [photoURLs]?
}

struct photoURLs: Codable{
    var id : String?
    var urls : url?
}

struct user : Codable {
    var username : String?
    var name : String?
}

struct url : Codable {
    var full : String?
    var small : String?
}




struct ImageDetails {
    let published : String
    let collectedBy : String
    let urls : url
}
//struct url: Codable {
//    var raw : String?
////    var full : String?
////    var small : String?
//}
