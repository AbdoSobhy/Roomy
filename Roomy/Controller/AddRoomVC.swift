//
//  AddRoomVC.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/23/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class AddRoomVC: UIViewController {
    @IBOutlet weak var titleRoom: UITextField!
    @IBOutlet weak var placeRoom: UITextField!
    @IBOutlet weak var priceRoom: UITextField!
    @IBOutlet weak var descriptionRoom: UITextField!
    
    @IBOutlet weak var imageRoom: UIImageView!
    var pickedImage:UIImage?{
        didSet{
            imageRoom.image = pickedImage
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func choseImage(_ sender: Any) {
       let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageRoom.image = UIImage(named: "Placeholder")
    }
    
    
    @IBAction func addRoom(_ sender: Any) {
        guard let titleRoom = titleRoom.text, !titleRoom.isEmpty else {return}
        guard let placeRoom = placeRoom.text, !placeRoom.isEmpty else {return}
        guard let priceRoom = priceRoom.text, !priceRoom.isEmpty else {return}
        let description = descriptionRoom.text
        let image = imageRoom.image
        
        
        RoomsRequest.addRoom(title: titleRoom, place: placeRoom, price: priceRoom, description: description, image: image) { (success:Bool, error:Error?) in
            if success{
                let FeatchRoomsVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(identifier: "FeatchRoomsVC" ) as! FeatchRoomsVC
                self.navigationController?.pushViewController(FeatchRoomsVC, animated: true)
            }
        }
    }
}
extension AddRoomVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.pickedImage = editedImage
            } else if let editedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                self.pickedImage = editedImage
            }
        
    }
}




