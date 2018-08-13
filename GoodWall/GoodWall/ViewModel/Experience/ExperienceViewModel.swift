//
//  ExperienceViewModel.swift
//  GoodWall
//
//  Created by Keith Randell Gapusan on 12/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class ExperienceViewModel: NSObject {
    var listExperience = [Experience]()
    var filteredExperience = [Experience]()
    public static let shared = ExperienceViewModel()
    
    func numberOfRowsInSection(searchIsActive : Bool) -> Int{
        if searchIsActive{
            return filteredExperience.count
            
        }else{
            return listExperience.count
        }
    }
    
    func numberOfSection() -> Int{
        return 1
    }
    
    func getDataAtRow(_ indexPathRow : Int ,  isActive : Bool) -> Experience{
        if isActive{
            return filteredExperience[indexPathRow]
        }else{
            return listExperience[indexPathRow]
        }
        
    }
    func getFilteredData(_ searchByExperice:String){
        
        let filtered = listExperience.filter {
            ($0.title!.uppercased().contains(searchByExperice.uppercased()))
        }
        
        filteredExperience = filtered
        
    }
    
    func fetchAllExpericeData(_  completion : @escaping (_ error : Error? , _ messageResult :[String:Any]?) -> () ) {
        
//        APIHandler.shared.getListOfCountry(Constant.baseUrl) {[weak self] (json, error) in
//            if error != nil {
//                print("an error accured")
//                completion(error , nil)
//            }else{
//
//
//                for data in json!{
//                    self?.listCountry.append(Country.init(data as [String:Any])!)
//                }
//                completion(nil , nil)
//            }
//        }
    }
}
