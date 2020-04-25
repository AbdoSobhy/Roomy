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
    enum Constants{
        
        static var auth_token = UserDefaults.standard.object(forKey: "auth_token") as? String
    }
    case signIn(email:String,password:String)
    case signUp(name: String, email: String, password: String)
    case featchRooms
    case addRoom(title:String,place:String,price:String,description:String?,image:UIImage?)
    
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
    var parameters : [String:Any]{
        switch self {
        case .signIn(let email,let password):
            return ["email":email,
                    "password": password]
        case . signUp(let name,let email,let password):
            return ["name":name,
                    "email":email,
                    "password":password]
            
        case .addRoom(let title,let place,let price,let description,let image):
            return ["title":title,
                    "place":place,
                    "price":price,
                    "description":description ?? "",
                    "image":image ?? "" ]
        default:
            return [:]
        }
        
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        
        
        urlRequest.setValue(Constants.auth_token, forHTTPHeaderField: "Authorization")
        
        return try URLEncoding.default.encode(urlRequest, with: parameters)
        
        
    }
}
