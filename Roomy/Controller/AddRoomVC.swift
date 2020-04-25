//
//  AddRoomVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/23/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class AddRoomVC: UIViewController {
    @IBOutlet weak var titleRoom: UITextField!
    @IBOutlet weak var placeRoom: UITextField!
    @IBOutlet weak var priceRoom: UITextField!
    @IBOutlet weak var descriptionRoom: UITextField!
    
    @IBOutlet weak var imageRoom: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func addRoom(_ sender: Any) {
        guard let titleRoom = titleRoom.text, !titleRoom.isEmpty else {return}
        guard let placeRoom = placeRoom.text, !placeRoom.isEmpty else {return}
        guard let priceRoom = priceRoom.text, !priceRoom.isEmpty else {return}
        let description = descriptionRoom.text
        let image = imageRoom.image
        
        
        RoomsRequest.addRoom(title: titleRoom, place: placeRoom, price: priceRoom, description: description, image: image) { (success:Bool, error:Error?) in
            if success{
                let FeatchRoomsVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(identifier: "FeatchRoomsVC" ) as! FeatchRoomsVC
                self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
            }
        }
    }
}




