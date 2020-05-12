//
//  UserVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/4/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire

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
        
        RoomsRequest.signIn(email: userTF, password: passTF) { (success:Bool, error:Error?) in
            if success{
                let FeatchRoomsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FeatchRoomsVC" ) as! FeatchRoomsVC
                self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
            }
        }
    }
}




