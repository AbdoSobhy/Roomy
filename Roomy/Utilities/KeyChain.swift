//
//  KeyChain.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 5/13/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import KeychainSwift
class KeyChain{
    
    static let shared = KeyChain()
    
   let KeyChainObject = KeychainSwift()
    func setKey(keyName : String , keyValue : String) {
        KeyChainObject.set(keyValue, forKey: keyName)
        
    }
    func getKey(keyName : String) -> String? {
       return KeyChainObject.get(keyName)
    }
}
