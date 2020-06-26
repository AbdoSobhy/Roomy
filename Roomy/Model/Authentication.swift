//
//  Authentication.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 6/26/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
struct Authentication : Codable {
    private let authToken : String
    
        enum CodingKeys: String, CodingKey  {
        case authToken = "auth_token"
    }

}
