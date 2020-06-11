//
//  SignUpPresenter.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 6/7/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation

protocol SignUpView : AnyObject  {
    func navigateToRooms()
    func startAnimation()
    func stopAnimation()
}

protocol SignUpPresenter {
    func signUp(fullName : String, userName:String, signUpPassword:String)
}

class SignUpPresenterImpl : SignUpPresenter {
    weak var view : SignUpView?
    init(view : SignUpView) {
        self.view = view
    }
    func signUp(fullName : String, userName:String, signUpPassword:String){
        self.view?.startAnimation()
        RoomsRequest.signUp(name: fullName, email: userName, password: signUpPassword) { (success:Bool, error:Error?) in
            if success{
                self.view?.stopAnimation()
                self.view?.navigateToRooms()
            }
        }
    }
}
