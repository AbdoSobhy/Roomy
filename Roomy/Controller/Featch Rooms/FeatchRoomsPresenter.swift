//
//  FeatchRoomsPresenter.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 6/7/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation

protocol FeatchRoomsView : AnyObject {
    
}
protocol FeatchRoomsPresenter {
    func getRooms() -> [Room]
}
class FeatchRoomsPresenterImpl : FeatchRoomsPresenter {
    weak var view : FeatchRoomsView?
    init(view : FeatchRoomsView) {
        self.view = view
    }
    
    func getRooms() -> [Room] {
        var roomsArr = [Room]()
        RoomsRequest.feachRooms { response in
            switch response{
            case .success(let rooms):
                roomsArr = rooms
                
            case .failure:
                roomsArr.append(contentsOf: RealmManger.featchRooms())
            }
        }
        return roomsArr
        
    }
    
    
}
