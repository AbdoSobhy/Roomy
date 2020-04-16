//
//  Config.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/5/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
struct URLs {
    static let mainURL = "https://roomy-application.herokuapp.com/"
    ///    parameter {user,pass}
    static let login = mainURL + "auth/login"
    ///    parameter {user,pass,name}
    static let signUP = mainURL + "signup"
    ///    parameter {title,place,price.description,image}
    ///    header {Authorization}
    static let addRoom = mainURL + "rooms"
    ///    header {Authorization}
    static let featchRooms = mainURL + "rooms"

    
}
