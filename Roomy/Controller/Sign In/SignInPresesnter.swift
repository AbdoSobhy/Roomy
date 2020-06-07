//
//  SignInPresesnter.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 6/7/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import FBSDKLoginKit

protocol SignInView : AnyObject{
    func navigateToFeatchRoomsVC()
}

protocol SignInPresesnter {
    func signInWithLoginBtn(email : String , password : String)
    func signInWithFacebook(VC : UIViewController)
    
}

class SignInPresesnterImpl : SignInPresesnter {
    
    weak var view : SignInView?
    init(view : SignInView) {
        self.view = view
    }
    
    func signInWithFacebook(VC : UIViewController){
        if AccessToken.current != nil {
            FacebookManger.shared.featchProfile { (result) in
                guard let email = result!["email"].string else {return}
                let pass = "123456"
                RoomsRequest.signIn(email: email, password: pass) { (isSuccess, error) in
                    if isSuccess{
                        self.view?.navigateToFeatchRoomsVC()
                    }
                }
            }
        }
        else {
            
            FacebookManger.shared.login(VC: VC)
        }
    }
    
    func signInWithLoginBtn(email: String, password: String) {
        RoomsRequest.signIn(email: email, password: password) { (success:Bool, error:Error?) in
            if success{
                self.view?.navigateToFeatchRoomsVC()
            }
        }
    }
}
