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
    func showAlert()
    func startAnimation()
    func stopAnimation()
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
                RoomsRequest.apiRequest(request: RoomsRouter.signIn(email: email, password: pass)) { (auth : Authentication? , err) in
                    if auth != nil {
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
        view?.startAnimation()
        RoomsRequest.apiRequest(request: RoomsRouter.signIn(email: email, password: password)) { (auth : Authentication?, err) in
            if let authentication = auth?.authToken {
                KeyChain.shared.setKey(keyName: "auth_token", keyValue: authentication)
                self.view?.stopAnimation()
                self.view?.navigateToFeatchRoomsVC()
            } else {
                self.view?.stopAnimation()
                self.view?.showAlert()
            }
        }
    }
}
