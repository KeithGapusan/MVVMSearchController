//
//  Country.swift
//  GoodWall
//
//  Created by Keith Gapusan on 07/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class Country: NSObject {
 
    var name : String?
    var capital : String?
    var flag: String?
    
    public init?(_ json : [String:Any]){
        self.name = json["name"] as? String  ?? ""
        self.capital = json["capital"] as? String ?? ""
        self.flag = json["flag"] as? String ?? ""
    }

}
