//
//  DetailedRoomPresenter.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 6/7/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Kingfisher
protocol DetailedRoomView : AnyObject{
    func showDetails()
}
protocol DetailedRoomPresenter {
    func showDetails()
}
class DetailedRoomPresenterImpl : DetailedRoomPresenter {
    
    weak var view : DetailedRoomView?
    init(view : DetailedRoomView) {
        self.view = view
    }
    
    func showDetails() {
        self.view?.showDetails()
    }
    
}
