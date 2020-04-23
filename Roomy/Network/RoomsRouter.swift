//
//  RoomsRouter.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire

enum RoomsRouter: URLRequestConvertible {

    case signIn(email:String , password :String)
    case signUp
    case featchRooms
    case addRoom
    
    var url : URL {
        switch self {
        case .signIn:
            return URL(string: "https://roomy-application.herokuapp.com/auth/login")!
        case .signUp:
            return URL(string: "https://roomy-application.herokuapp.com/signup")!
        case .featchRooms:
            return URL(string: "https://roomy-application.herokuapp.com/rooms")!
        case .addRoom:
            return URL(string: "https://roomy-application.herokuapp.com/rooms")!
    }

    }
    var method : HTTPMethod {
        switch self {
        case .signIn:
            return .post
        case . signUp:
            return .post
        case .featchRooms:
            return .get
        case .addRoom:
            return.post
        }
    }
    var parameters : Parameters?{
        switch self {
        case .signIn:
            return ["email":"",
                    "password": ""]
        case . signUp:
            return ["name":"",
                    "email":"",
                    "password":""]
        case .featchRooms:
            return nil
        case .addRoom:
            return ["title":"",
                    "place":"",
                    "price":"",
                    "description":"",
                    "image":"",]
        }
        
    }
//    headers: HTTPHeaders? = nil
    
    var headers : HTTPHeaders?{
        switch self {
        case .signIn:
            return nil
        case . signUp:
            return nil
        case .featchRooms:
            return ["Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2OTIsImV4cCI6MTU4Nzc0NjY1MX0.GKXhICrzO4j_TBdvLJjlQJtTRCUsjLzR_AHYjjDumvE"]
        case .addRoom:
            return ["Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2OTIsImV4cCI6MTU4Nzc0NjY1MX0.GKXhICrzO4j_TBdvLJjlQJtTRCUsjLzR_AHYjjDumvE"]
        }
        
    }
    
    
    
    
    func asURLRequest() throws -> URLRequest {
       var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = headers ?? ["Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2OTIsImV4cCI6MTU4Nzc0NjY1MX0.GKXhICrzO4j_TBdvLJjlQJtTRCUsjLzR_AHYjjDumvE"]
        return urlRequest
    }
}
