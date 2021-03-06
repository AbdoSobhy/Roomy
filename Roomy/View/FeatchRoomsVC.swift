//
//  ViewController.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 3/11/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
import SkeletonView

class FeatchRoomsVC: UIViewController {
    var featchRoomsPresenter : FeatchRoomsPresenter?
    @IBOutlet weak var roomsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featchRoomsPresenter = FeatchRoomsPresenterImpl(view : self)
    }
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        view.showAnimatedGradientSkeleton()
        featchRoomsPresenter?.getRooms({ (rooms) in
            if !rooms.isEmpty {
                self.featchRoomsPresenter?.rooms.append(contentsOf: rooms)
                self.view.hideSkeleton()
                self.roomsTableView.reloadData()
            }
        })
    }
}
extension FeatchRoomsVC : SkeletonTableViewDataSource{
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "RoomTableViewCell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featchRoomsPresenter?.roomsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as!RoomTableViewCell
        self.featchRoomsPresenter?.confuger(cell: cell, row: indexPath.row)
        return cell
    }
}
extension FeatchRoomsVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedRoom = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailedRoom") as! DetailedRoom
        detailedRoom.descriptionText = featchRoomsPresenter!.rooms[indexPath.row].descriptions
        detailedRoom.imageHolder = featchRoomsPresenter!.rooms[indexPath.row].image
        self.navigationController?.pushViewController(detailedRoom, animated: true)
    }
}
extension FeatchRoomsVC : FeatchRoomsView{
    
}

