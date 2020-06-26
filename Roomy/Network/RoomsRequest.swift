//
//  RoomsRequest.swift
//  Roomy
//
//  Created by Abdelrahman Sobhy on 4/20/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class RoomsRequest{
    
    static func apiRequest<T : Codable>(request : RoomsRouter,  completionHandeler: @escaping (T?,Error?) -> Void) {
        AF.request(request).responseData { (response : AFDataResponse<Data>) in
            switch response.result{
            case .success(let result):
                do {
                    let obj = try JSONDecoder().decode(T.self, from: result)
                    completionHandeler(obj , nil)
                } catch {
                    completionHandeler(nil , error)
                }
            case .failure(let error):
                completionHandeler(nil , error)
            }
        }
    }
    
}
