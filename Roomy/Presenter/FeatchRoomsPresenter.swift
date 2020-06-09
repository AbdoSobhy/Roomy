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
    func getRooms(_ completionHandeler : @escaping ([Room])->Void )
    func getRoomsCount(_ rooms : [Room]) -> Int
}
class FeatchRoomsPresenterImpl : FeatchRoomsPresenter {
    weak var view : FeatchRoomsView?
    

    init(view : FeatchRoomsView) {
        self.view = view
    }
    
    func getRoomsCount(_ rooms : [Room]) -> Int {
       return rooms.count
    }
    func getRooms(_ completionHandeler : @escaping ([Room])->Void ) {
        RoomsRequest.feachRooms { response in
            switch response{
            case .success(let rooms):
                completionHandeler(rooms)
            case .failure:
                completionHandeler(RealmManger.featchRooms())
            }
        }
        
    }
    
    
}
