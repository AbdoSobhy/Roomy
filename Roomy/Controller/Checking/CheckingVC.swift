//
//  CheckingVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/23/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class CheckingVC: UIViewController {
    var checkingPresenter : CheckingPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        checkingPresenter = CheckingPresenterImpl(view: self)
        
    }
    
    @IBAction func checkLogin(_ sender: Any) {
        checkingPresenter?.cheakUserBeforeLogin()
    }
}
extension CheckingVC : CheckingView{
    func navigateToFeatchRoomsVC() {
        let FeatchRoomsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeatchRoomsVC" ) as! FeatchRoomsVC
        self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
    }
    
    func navigateToSignInVC() {
        let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC" ) as! SignInVC
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
}
