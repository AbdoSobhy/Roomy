//
//  UserVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/4/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire
import FBSDKLoginKit
import SwiftyJSON

class SignInVC : UIViewController{
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var facebookBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func unwindFromSkillVC(unwindSegue : UIStoryboardSegue) {
        
    }
    @IBAction func facebookLoginWasPressed(_ sender: Any) {
        if AccessToken.current != nil {
            FacebookManger.shared.featchProfile { (result) in
                guard let email = result!["email"].string else {return}
                let pass = "123456"
                RoomsRequest.signIn(email: email, password: pass) { (isSuccess, error) in
                    if isSuccess{
                        guard let FeatchRoomsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeatchRoomsVC" ) as? FeatchRoomsVC else { return }
                        self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
                    }
                }
            }
        }
        else {

            FacebookManger.shared.login(VC: self)

        }
    }
    @IBAction func signInButton(_ sender: Any) {
        //        Check textfield are empty or not
        guard let userTF = userNameTF!.text, !userTF.isEmpty else {return}
        guard let passTF = passwordTF!.text, !passTF.isEmpty else {return}
        
        RoomsRequest.signIn(email: userTF, password: passTF) { (success:Bool, error:Error?) in
            if success{
                let FeatchRoomsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeatchRoomsVC" ) as! FeatchRoomsVC
                self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
            }
        }
    }
}




