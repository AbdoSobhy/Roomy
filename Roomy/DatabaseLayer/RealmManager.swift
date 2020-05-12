//
//  RealmManager.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManger{
    
    private static let realm = try! Realm()
    static func saveRooms(rooms:[Room]){
        try! realm.write {
            realm.add(rooms, update: .modified)
        }
    }
    
    static func featchRooms()-> [Room]{
        let rooms = realm.objects(Room.self)
        var roomsArray = [Room]()
        for room in rooms {
            roomsArray.append(room)
        }
        return roomsArray
    }
    
}
