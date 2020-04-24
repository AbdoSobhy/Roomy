//
//  CheckingVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/23/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class CheckingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkLogin(_ sender: Any) {
        
        if UserDefaults.standard.object(forKey: "auth_token") != nil {
              let FeatchRoomsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FeatchRoomsVC" ) as! FeatchRoomsVC
            self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)

        }
        else{
            
            let SignInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignInVC" ) as! SignInVC
                       self.navigationController?.pushViewController(SignInVC, animated: true)
        }
        
    }


}
