//
//  ExperienceViewModel.swift
//  GoodWall
//
//  Created by Keith Randell Gapusan on 12/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ExperienceViewModel: NSObject {
    var rootExperienceModel : ExperienceRootClass?
    var rootExperienceModel2 : Variable<ExperienceRootClass>?
    var listExperience : Variable<[Experience]> = Variable([])
    var filteredExperience : Variable<[Experience]> = Variable([])
    
    var listComments : Variable<[ExperienceComment]> = Variable([])
    var filteredComments : Variable<[ExperienceComment]> = Variable([])
    
    var listOfPictures : Variable<[ExperiencePicture]> = Variable([])
    var filteredPictures : Variable<[ExperiencePicture]> = Variable([])
   
    let disposeBag = DisposeBag()
    
    public static let shared = ExperienceViewModel()
    
    func numberOfRowsInSection(searchIsActive : Bool) -> Int{
        if searchIsActive{
            return filteredExperience.value.count
            
        }else{
            return listExperience.value.count
        }
    }
    
    func numberOfSection() -> Int{
        return 1
    }
    
    func getDataCommentInRow(_ indexPathRow : Int ) -> Variable<[ExperienceComment]>{
        let searchById = listExperience.value[indexPathRow].comments
        var comments = [ExperienceComment]()
        for id in searchById!{
            let filtered = self.listComments.value.filter {
                String($0.id).uppercased().contains(String(id))
            }
            comments.append(filtered[0])
        }
        self.filteredComments.value = comments
        return   self.filteredComments
    }
    
    func getDataAtRow(_ indexPathRow : Int ,  isActive : Bool) -> Experience{
        if isActive{
            return filteredExperience.value[indexPathRow]
        }else{
            return listExperience.value[indexPathRow]
        }
    }
    func getFilteredData(_ searchByExperice:String){
       _ = listExperience.asObservable()
            .map{
                $0.filter{$0.title.uppercased().contains(searchByExperice.uppercased())}
        }.bind(to: self.filteredExperience).disposed(by: disposeBag)
    }
    
    func getListOfPictures(_ searchById: [Int]) -> [ExperiencePicture]{
        var experience = [ExperiencePicture]()
        for id in searchById{
            let filtered = self.listOfPictures.value.filter {
                
                String($0.id).uppercased().contains(String(id))
            }
            experience.append(filtered[0])
        }
        self.filteredPictures.value = experience
        return self.filteredPictures.value
        
    }
    
    func fetchAllExpericeData(_  completion : @escaping (_ error : Error? , _ messageResult :[String:Any]?) -> () ) {
        
        APIHandler.shared.getDictionaryOfData("https://api.myjson.com/bins/11dz98") { (dataDictionary, error) in
                        if error != nil {
                            print("an error accured")
                            completion(error , nil)
                        }else{
                            self.rootExperienceModel = ExperienceRootClass.init(fromDictionary: dataDictionary!)
                            self.listExperience.value = (self.rootExperienceModel?.payload.data.experiences)!
                            self.listOfPictures.value = (self.rootExperienceModel?.payload.data.pictures)!
                            self.listComments.value = (self.rootExperienceModel?.payload.data.comments)!
                            self.rootExperienceModel2?.value =  ExperienceRootClass.init(fromDictionary: dataDictionary!)
                    }
                    completion(nil , nil)
            }
        }
        
    
}
