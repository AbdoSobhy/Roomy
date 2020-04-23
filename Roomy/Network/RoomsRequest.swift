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
    /// Add Room
    static func signIn(email : String , password:String,_ completionHandeler: @escaping (Result<Request,Error>) -> Void) {
        AF.request(RoomsRouter.signIn(email: email, password: password)).responseJSON { Response in
            switch Response.result{
            case.success(let result):
                print(result)
            case.failure(let error):
                print(error)
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
                    let realm = try! Realm()
                    
                    if realm.isEmpty{
                        try realm.write {
                            realm.add(rooms)
                        }
                    }
                    
                    
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
