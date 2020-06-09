//
//  RoomCell.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/21/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func confugerCell(room : Room) {
        titleLabel.text = room.title
        placeLabel.text = room.place
        priceLabel.text = room.price
    }
    
}
