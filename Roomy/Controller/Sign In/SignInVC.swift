//
//  UserVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/4/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit


class SignInVC : UIViewController{
    var signInPresenter : SignInPresesnter?
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var facebookBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInPresenter = SignInPresesnterImpl(view : self)
    }
    @IBAction func unwindFromSkillVC(unwindSegue : UIStoryboardSegue) {
        
    }
    @IBAction func facebookLoginWasPressed(_ sender: Any) {
        signInPresenter?.signInWithFacebook(VC: self)
    }
    @IBAction func signInButton(_ sender: Any) {
        //        Check textfield are empty or not
        guard let userTF = userNameTF!.text, !userTF.isEmpty else {return}
        guard let passTF = passwordTF!.text, !passTF.isEmpty else {return}
        signInPresenter?.signInWithLoginBtn(email: userTF, password: passTF)
    }
}
extension SignInVC : SignInView {
    func navigateToFeatchRoomsVC() {
        let FeatchRoomsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeatchRoomsVC" ) as! FeatchRoomsVC
        self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
    }
}



