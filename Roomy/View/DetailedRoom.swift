//
//  DetailedRoom.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/23/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
import Kingfisher

class DetailedRoom: UIViewController {
    var detailedRoomPresenter : DetailedRoomPresenter?
    var descriptionText : String?
    var imageHolder : String?
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var descriptionDetails: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedRoomPresenter = DetailedRoomPresenterImpl(view : self)
        
        detailedRoomPresenter?.showDetails()
        
    }
    
    
}
extension DetailedRoom : DetailedRoomView {
    func showDetails() {
        descriptionDetails.text = descriptionText
        
        imageDetails.kf.setImage(with: URL(string: imageHolder ?? "https://www.google.com/url?sa=i&source=images&cd=&cad=rja"))
    }   
}
