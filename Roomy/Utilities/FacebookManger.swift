//
//  FacebookManger.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 5/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import SwiftyJSON
import Alamofire
class FacebookManger {
    static let shared = FacebookManger()
    
    func login(VC : UIViewController) {
        let loginButton = LoginManager()
          loginButton.logIn(permissions: [.email, .publicProfile] , viewController: VC) { permissionResult in
              switch permissionResult{
              case .cancelled:
                  break
              case .failed( _):
                  break
              case .success(granted: _, declined: _, token: _):
                  self.featchProfile { (result) in
                      if result != nil {
                          guard let email =  result!["email"].string else {return}
                          guard let name = result!["name"].string else {return}
                          let pass = "123456"
                          RoomsRequest.signUp(name: name, email: email, password: pass) { (isSuccess, error) in
                              if isSuccess{
                                  guard let FeatchRoomsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeatchRoomsVC" ) as? FeatchRoomsVC else { return }
                                VC.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
                              }
                          }
                      }
                  }
              }
          }
    }
    
    func featchProfile(_ completionHandeler : @escaping (_ result : JSON? )->Void){
        let parameter : Parameters = ["fields": "email, id, name, first_name, last_name"]
        GraphRequest(graphPath: "me", parameters: parameter).start { (connection, result, error) in
            if (result != nil){}
                let jsonResult = JSON(result as Any)
                completionHandeler(jsonResult)
            }
        }
    }
    

