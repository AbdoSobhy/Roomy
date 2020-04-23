//
//  Room.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
class Room : Object,  Codable {
    @objc dynamic var id : Int = 0
    @objc dynamic var title : String? = ""
    @objc dynamic var price : String? = ""
    @objc dynamic var place : String? = ""
    @objc dynamic var image : String? = ""
    @objc dynamic var descriptions : String? = ""   //  <--- defrant parameter orgin is description
    @objc dynamic var created_at : String? = ""
    @objc dynamic var updated_at : String? = ""

    
    enum CodingKeys: String, CodingKey  {
        case descriptions = "description"
        case title
        case price
        case place
        case image

    }
}
