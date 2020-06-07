//
//  CheckingPresenter.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 6/7/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation

protocol CheckingView : AnyObject {
    func navigateToFeatchRoomsVC()
    func navigateToSignInVC()
    
}

protocol CheckingPresenter {
    func cheakUserBeforeLogin()
    
}

class CheckingPresenterImpl : CheckingPresenter {
    weak var view : CheckingView?
    init(view : CheckingView) {
        self.view = view
    }
    func cheakUserBeforeLogin() {
        
        if KeyChain.shared.getKey(keyName: "auth_token") != nil {
            view?.navigateToFeatchRoomsVC()
            
        }
        else{
            view?.navigateToSignInVC()
        }
        
    }
    
}
