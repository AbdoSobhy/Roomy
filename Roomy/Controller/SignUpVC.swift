//
//  SignUpVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/4/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpVC: UIViewController {
    @IBOutlet weak var signUpFullName: UITextField!
    
    @IBOutlet weak var signUpUsername: UITextField!
    
    @IBOutlet weak var signUpPassword: UITextField!
    
    @IBOutlet weak var signUpConfirmPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signUpButton(_ sender: Any) {
        

        //        Check lables are empty or not
            guard let fullName = signUpFullName.text, !fullName.isEmpty else {return}
            guard let userName = signUpUsername.text, !userName.isEmpty else {return}
            guard let signUpPassword = signUpPassword.text, !signUpPassword.isEmpty else {return}
            guard let confirmPassword = signUpConfirmPass.text, !confirmPassword.isEmpty else {return}
        
        if signUpPassword == confirmPassword{
        
            Connection.signUp(fullName: fullName, userName: userName, password: signUpPassword) { (error:Error?, success:Bool) in
                if success{
//                    do another think
                    
                }
            }
    }
    

}
}
