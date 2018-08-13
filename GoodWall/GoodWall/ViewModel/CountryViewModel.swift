//
//  CountryViewModel.swift
//  GoodWall
//
//  Created by Keith Gapusan on 07/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class CountryViewModel: NSObject {
    var listCountry = [Country]()
    var filteredCountry = [Country]()
     public static let shared = CountryViewModel()
    
    func numberOfRowsInSection(searchIsActive : Bool) -> Int{
         if searchIsActive{
            return filteredCountry.count
           
         }else{
             return listCountry.count
        }
    }
    
    func numberOfSection() -> Int{
        return 1
    }
    
    func getDataAtRow(_ indexPathRow : Int ,  isActive : Bool) -> Country{
        if isActive{
            return filteredCountry[indexPathRow]
        }else{
            return listCountry[indexPathRow]
        }

    }
    func getFilteredData(_ searchByCountry:String){
        
        let filtered = listCountry.filter {
            ($0.name!.uppercased().contains(searchByCountry.uppercased()))
        }

        filteredCountry = filtered

    }
    
    func fetchAllCountryData(_  completion : @escaping (_ error : Error? , _ messageResult :[String:Any]?) -> () ) {
     
        APIHandler.shared.getListOfCountry(Constant.baseUrl) {[weak self] (json, error) in
            if error != nil {
                print("an error accured")
                completion(error , nil)
            }else{
             
                
                for data in json!{
                    self?.listCountry.append(Country.init(data as [String:Any])!)
                }
                 completion(nil , nil)
            }
        }
    }
}
//public extension Int {
//    public var asWord: String {
//        let numberValue = NSNumber(value: self)
//        var formatter = NumberFormatter()
//        formatter.numberStyle = .spellOut
//        return formatter.string(from: numberValue)!
//    }
//}

