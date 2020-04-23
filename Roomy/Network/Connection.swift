//
//  Connection.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/5/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Connection: NSObject {
//    login func
    class func login(userName:String, password:String , completion : @escaping (_ error:Error?,_ success : Bool)-> Void){
        let url = URLs.login
        let parameters = [
            "email": userName, //email
            "password": password //password
        ]
        
        AF.request(url ,method: .post, parameters: parameters)
            .responseJSON { response in
                switch response.result{
                case .success(let result):
                    let post = JSON(result)
                    //Handle the results as JSON
                    if let auth_token = post["auth_token"].string{
                        UserDefaults.standard.setValue(auth_token, forKey: "auth_token")
                        
                    }
                case .failure(let error):
                    print(error)

                }
        }

    }
//    signUp func
    class func signUp(fullName : String ,userName:String, password:String , completion : @escaping (_ error:Error?,_ success : Bool)-> Void){
  let url = URLs.signUP
    
    let parameters = [
        "name": fullName, //fullname
        "email": userName, //email
        "password": password //password
    ]

    
    AF.request(url ,method: .post, parameters: parameters)
        .responseJSON { response in
            switch response.result{
            case .success(let result):
                let post = JSON(result)
                //Handle the results as JSON

                let auth_token = post["auth_token"].string
                    UserDefaults.standard.setValue(auth_token, forKey: "auth_token")
                    
                
                
                //At this point the user should have authenticated, store the session id and use it as you wish
                
            case .failure(let error):
                print(error)
        
            }
    }

    }
//    add room
    class func addRoom(title:String,place:String,price:String,description:String?,image:String?,Authorization:String,complation : @escaping (_ error:Error? ,_ success : Bool)-> Void){
        
        let url = URLs.addRoom
          
          let parameters = [
              "title": title, //title
              "place": place, //place
              "price": price, //price
            "description": description ?? "", //description
            "image": image ?? ""] as [String : Any]
        
        let headers: HTTPHeaders = ["Authorization": Authorization]
                  
          AF.request(url ,method: .post, parameters: parameters, headers: headers)
              .responseJSON { response in
                  switch response.result{
                  case .success(let result):
                      let post = JSON(result)
                      //Handle the results as JSON
                      print(post)
                      //At this point the user should have authenticated, store the session id and use it as you wish
                      
                  case .failure(let error):
                      print(error)
              
                  }
          }
        
    }
    
    
    
//    featch rooms
    
    class func featchRooms(Authorization:HTTPHeaders ,complation : @escaping (_ error:Error? ,_ success : Bool)-> Void){
        
        let url = URLs.featchRooms
          
        
        let headers = Authorization
        
          
          AF.request(url ,method: .get, headers: headers)
              .responseJSON { response in
                  switch response.result{
                  case .success(let result):
                      let post = JSON(result)
                      //Handle the results as JSON
                      print(post)
                      //At this point the user should have authenticated, store the session id and use it as you wish
                      
                  case .failure(let error):
                      print(error)
              
                  }
          }
        
    }
    
    

}
