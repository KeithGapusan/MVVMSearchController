//
//  APIHandler.swift
//  GoodWall
//
//  Created by Keith Gapusan on 07/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit
import Alamofire

class APIHandler: NSObject {
   public static let shared = APIHandler()
    
    
    func getListOfCountry(_ strUrl: String,  completed : @escaping (_ json : [[String:Any]]?, _ error : Error? ) -> Void){
       print(strUrl)
        Alamofire.request(strUrl, method: .get).responseJSON { (response) in
            
            if response.error != nil{
                completed(nil , response.error)
            }else{
                if let result = response.result.value as? [[String:Any]]{
                    completed(result, nil)
                }else{
                    completed([["message": "Something's went wrong. Please try again later."]], nil)
                }
            }
        }
    }
    
}
