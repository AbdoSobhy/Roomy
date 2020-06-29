//
//  FeatchRoomsPresenter.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 6/7/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
/// cell protocol
protocol RoomCellPresenter {
}
protocol RoomCellView {
    func desplay(title: String)
    func desplay(place: String)
    func desplay(price: String)
}
/// ViewController Protocol
protocol FeatchRoomsView : AnyObject {
    
}

protocol FeatchRoomsPresenter {
    var rooms : [Room]{ get set }
    var roomsCount: Int { get }
    func getRooms(_ completionHandeler : @escaping ([Room])->Void )
    func confuger(cell : RoomCellView , row : Int)
    
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
        RoomsRequest.apiRequest(request: RoomsRouter.featchRooms) { (rooms : [Room]?, err) in
            if var rooms = rooms {
                rooms.sort(){$0.created_at! > $1.created_at!}
                RealmManger.saveRooms(rooms: rooms)
                completionHandeler(rooms)
            } else {
                completionHandeler(RealmManger.featchRooms())
            }
        }
    }
}
extension FeatchRoomsPresenterImpl : RoomCellPresenter {
    func confuger(cell : RoomCellView , row : Int) {
        cell.desplay(title: self.rooms[row].title ?? "")
        cell.desplay(place: self.rooms[row].place ?? "")
        cell.desplay(price: self.rooms[row].price ?? "")
    }
}

