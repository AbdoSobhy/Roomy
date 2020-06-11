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
}
extension RoomTableViewCell : RoomCellView{
    func desplay(title: String){
        titleLabel.text = title
    }
    func desplay(place: String){
        placeLabel.text = place
    }
    func desplay(price: String){
        priceLabel.text = price
    }
}
