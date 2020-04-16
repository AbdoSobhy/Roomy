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
@IBDesignable
class MyCustom: UIView {
    
}
extension UIView {
   @IBInspectable var borderWidth : CGFloat{
        set{
            self.layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    @IBInspectable var borderColor : UIColor{
        set{
            self.layer.borderColor = newValue.cgColor        }
        get{
            return UIColor(cgColor: self.layer.borderColor! )
        }
    }
}

class LoginVC : UIViewController{
    @IBOutlet weak var userNameLable: UITextField!
    @IBOutlet weak var passwordLable: UITextField!


        override func viewDidLoad() {
            super.viewDidLoad()
        }
    
    @IBAction func unwindFromSkillVC(unwindSegue : UIStoryboardSegue) {
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
//        Check lables are empty or not
        guard let userTF = userNameLable.text, !userTF.isEmpty else {return}
        guard let passTF = passwordLable.text, !passTF.isEmpty else {return}
        
        Connection.login(userName: userTF, password: passTF) { (error:Error?, success:Bool) in
            if success{
//                move to anoter page
                print("haay")
            }
        }

    }
    
    
}


