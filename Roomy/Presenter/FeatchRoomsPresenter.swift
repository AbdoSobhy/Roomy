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
    var rooms : [Room]{ get set }
    var roomsCount: Int { get }
}

class FeatchRoomsPresenterImpl {
    weak var view : FeatchRoomsView?
    var rooms = [Room]()

    init(view : FeatchRoomsView) {
        self.view = view
    }
}
extension FeatchRoomsPresenterImpl : FeatchRoomsPresenter{
    var roomsCount: Int{
        rooms.count
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

