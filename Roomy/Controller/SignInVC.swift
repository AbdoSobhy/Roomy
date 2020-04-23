//
//  UserVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/4/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SignInVC : UIViewController{
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!


        override func viewDidLoad() {
            super.viewDidLoad()
            
    }
    
    @IBAction func unwindFromSkillVC(unwindSegue : UIStoryboardSegue) {
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
//        Check textfield are empty or not
        guard let userTF = userNameTF!.text, !userTF.isEmpty else {return}
        guard let passTF = passwordTF!.text, !passTF.isEmpty else {return}
        
        Connection.login(userName: userTF, password: passTF) { (error :Error?, success:Bool) in
            if success{
                let FeatchRoomsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FeatchRoomsVC" ) as! FeatchRoomsVC
                self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
            }
        }
         
//                RoomsRequest.signIn(email: userTF, password: passTF) { response in
//            switch response{
//            case .success(let result):
//
//                print(result)
//            case .failure(let error):
//                print(error)
//
//
//            }
//        }
   
        

        
        
        }
    }




