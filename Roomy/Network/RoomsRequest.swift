//
//  RoomsRequest.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class RoomsRequest{
    /// Sign In
    static func signIn(email : String , password:String,_ completionHandeler: @escaping (_ success:Bool,_ error:Error?) -> Void) {
        AF.request(RoomsRouter.signIn(email: email, password: password)).responseJSON { Response in
            switch Response.result{
            case.success(let result):
                let post = JSON(result)
                
                if let auth_token = post["auth_token"].string{
                    completionHandeler(true,nil)
                    KeyChain.shared.setKey(keyName: "auth_token", keyValue: auth_token)
//                    UserDefaults.standard.setValue(auth_token, forKey: "auth_token")
                    RoomsRouter.Constants.auth_token = auth_token
                } else if post["auth_token"].string == nil{
                    completionHandeler(false,nil)

                }
            case.failure(let error):
                completionHandeler(false,error)
            }
        }
        
    }
    
    /// Sign Up
    static func signUp(name:String,email : String , password:String,_ completionHandeler: @escaping (_ success:Bool,_ error:Error?) -> Void) {

        AF.request(RoomsRouter.signUp(name: name, email: email, password: password)).responseJSON { Response in
            switch Response.result{
            case.success(let result):
                let post = JSON(result)
                completionHandeler(true,nil)
                if let auth_token = post["auth_token"].string{
                KeyChain.shared.setKey(keyName: "auth_token", keyValue: auth_token)
//                UserDefaults.standard.setValue(auth_token, forKey: "auth_token")
                RoomsRouter.Constants.auth_token = auth_token
                }
            case.failure(let error):
                completionHandeler(false,error)
            }
        }
        
    }
    
    /// Add Room
    static func addRoom(title: String, place: String, price: String, description: String?, image: UIImage?,_ completionHandeler: @escaping (_ success:Bool,_ error:Error?) -> Void) {
        AF.request(RoomsRouter.addRoom(title: title, place: place, price: price, description: description, image: image)).responseJSON { Response in
            switch Response.result{
            case.success( _):
                completionHandeler(true,nil)
                
            case.failure(let error):
                completionHandeler(false,error)
            }
        }
        
    }
    
    
    /// Featch Rooms
    static func feachRooms(_ completionHandeler: @escaping (Result<[Room],Error>) -> Void) {
        AF.request(RoomsRouter.featchRooms).responseData { (response : AFDataResponse<Data>) in
            switch response.result{
            case .success(let result):
                do {
                    let rooms = try JSONDecoder().decode([Room].self, from: result)
                    /// realm backup
                    RealmManger.saveRooms(rooms: rooms)
                    
                    completionHandeler(.success(rooms))
                    
                } catch {
                    
                    completionHandeler(.failure(error))
                }
            case .failure(let error):
                completionHandeler(.failure(error))
            }
        }
        
    }
}
