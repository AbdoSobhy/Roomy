//
//  MyCustom+Extintions.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

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
