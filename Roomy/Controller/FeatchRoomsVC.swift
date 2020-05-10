//
//  ViewController.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 3/11/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SkeletonView

class FeatchRoomsVC: UIViewController {
    
    @IBOutlet weak var roomsTableView: UITableView!
    private var rooms = [Room]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.showAnimatedGradientSkeleton()
        reloadRooms()
        
    }
    
    fileprivate func reloadRooms() {
        RoomsRequest.feachRooms { response in
            switch response{
            case .success(let rooms):
                self.rooms = rooms
                self.view.hideSkeleton()
                self.roomsTableView.reloadData()

            case .failure:
                let realm = try! Realm()
                let realmRoom = realm.objects(Room.self)
                for room in realmRoom{
                    self.rooms.append(room)
                }
                self.view.hideSkeleton()
                self.roomsTableView.reloadData()
            }
        }
    }
    
}
extension FeatchRoomsVC : SkeletonTableViewDataSource{
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "RoomCell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath) as!RoomCell
        
        let titleRoom = rooms[indexPath.row].title
        cell.titleLabel.text = titleRoom
        let placeRoom = rooms[indexPath.row].place
        cell.placeLabel.text = placeRoom
        let priceRoom = rooms[indexPath.row].price
        cell.priceLabel.text = priceRoom
        
        return cell
    }
}
extension FeatchRoomsVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedRoom = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailedRoom") as! DetailedRoom
        detailedRoom.descriptionText = rooms[indexPath.row].descriptions
        detailedRoom.imageHolder = rooms[indexPath.row].image
        self.navigationController?.pushViewController(detailedRoom, animated: true)
    }
}

