//
//  RoomCell.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/21/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
