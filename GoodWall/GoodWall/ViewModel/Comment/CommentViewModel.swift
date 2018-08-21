//
//  CommentViewModel.swift
//  GoodWall
//
//  Created by Keith Randell Gapusan on 20/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import RxSwift
import RxCocoa


class CommentViewModel: NSObject {
    var rootExperience: Variable<ExperienceRootClass>?
    var listOfComments: Variable<[ExperienceComment]>  = Variable([])
    var disposeBag = DisposeBag()
    func numberOfRowsInSection() -> Int{
       
            return listOfComments.value.count
            
    
    }
    
    func numberOfSection() -> Int{
        return 1
    }
    

    

    func setCommentValue(experienceRoot : ExperienceRootClass,  _ filter: [Int]){
        self.rootExperience?.value = experienceRoot
//        var commentList = self.rootExperience?.payload.data.comments
//    
//        var experience = [ExperiencePicture]()
//        for id in searchById{
//            let filtered = self.listOfPictures.filter {
//                
//                String($0.id).uppercased().contains(String(id))
//            }
//            experience.append(filtered[0])
//        }
//        self.filteredPictures = experience
    }

}
//private func setupCartObserver() {
//    //1
//    ShoppingCart.sharedCart.chocolates.asObservable()
//        .subscribe(onNext: { //2
//            chocolates in
//            self.cartButton.title = "\(chocolates.count) \u{1f36b}"
//        })
//        .addDisposableTo(disposeBag) //3
//}

