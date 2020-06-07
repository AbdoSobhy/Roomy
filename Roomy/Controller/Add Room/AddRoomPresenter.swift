//
//  AddRoomPresenter.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 6/7/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
protocol AddRoomView : AnyObject {
    func navigateToFeatchRoomsVC()
}
protocol AddRoomPresenter {
    func addRoom(title : String, place : String, price:String ,description : String? , image : UIImage? )
    
}
class AddRoomPresenterImpl : AddRoomPresenter {
    weak var view : AddRoomView?
    init(view : AddRoomView) {
        self.view = view
    }
    
    func addRoom(title : String, place : String, price:String ,description : String? , image : UIImage? ) {
        RoomsRequest.addRoom(title: title, place: place, price: price, description: description, image: image) { (success:Bool, error:Error?) in
            if success{
                self.view?.navigateToFeatchRoomsVC()
            }
        }
        
    }
    
}
