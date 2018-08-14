//
//  ExperienceViewController.swift
//  GoodWall
//
//  Created by Keith Gapusan on 10/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit
import SDWebImage

class ExperienceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel : ExperienceViewModel!
    var cellExperienceTableViewCell : ExperienceTableViewCell!
    var searchController =  UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        viewModel = ExperienceViewModel.shared
        viewModel.fetchAllExpericeData { (error, message) in
            self.tableView.reloadData()
        }
        
        

    }

    func initTableView(){
        cellExperienceTableViewCell = ExperienceTableViewCell()
        cellExperienceTableViewCell?.registerNib(tableView: self.tableView)
//        self.searchController = ({
//            let controller = UISearchController(searchResultsController: nil)
//            controller.searchResultsUpdater = self
//            controller.dimsBackgroundDuringPresentation = false
//            controller.searchBar.sizeToFit()
//            controller.searchBar.barStyle = UIBarStyle.black
//            controller.searchBar.barTintColor = UIColor.white
//            controller.searchBar.backgroundColor = UIColor.clear
//            self.tableView.tableHeaderView = controller.searchBar
//            return controller
//        })()
//        self.tableView.tableHeaderView = searchController.searchBar
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 607
    }

}


extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (viewModel?.numberOfRowsInSection(searchIsActive: searchController.isActive)) ?? 0
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellExperienceTableViewCell.getCellId(), for: indexPath)  as?  ExperienceTableViewCell{
            let data = viewModel?.getDataAtRow(indexPath.row,  isActive: searchController.isActive)
        //    let pictures  =
            cell.lblTitle.text = data?.title ?? ""
            cell.lblDate.text = data?.startDate ?? ""
            cell.lblDetails.text = data?.body ?? ""
            let listOfImages =  viewModel.getListOfPictures((data?.pictures)!)
            print("images = \(listOfImages[0].name)  == \(String(describing: data?.pictures[0])) ")
//            let  url = URL()
//            if url != nil{
//            if let url = URL(string: listOfImages[0].name!) {
//                  cell.imgViewBanner.sd_setImage(with: url, placeholderImage: UIImage(named: "default_featured_image"))
//            }else{
                 cell.imgViewBanner.sd_setImage(with: URL(string: "https://placemat.imgix.net/placeholder_images/images/000/000/159/original/eDLHCtzRR0yfFtU0BQar_sylwiabartyzel_themap.jpg?ixlib=rb-1.0.0&w=250&h=&fm=auto&crop=faces%2Centropy&fit=crop&txt=250%C3%97&txtclr=BFFF&txtalign=middle%2Ccenter&txtfit=max&txtsize=42&txtfont=Avenir+Next+Demi%2CBold&bm=multiply&blend=ACACAC&s=8e9e12d71cd9edf6cebb619c99760cd7"), placeholderImage: UIImage(named: "default_featured_image"))
//            }
            
//             //   print("image \(newsList[indexPath.row].imgFeaturedUrl!)")
//
 //          }
            
            cell.imgUserProfile.sd_setImage(with: URL(string: "https://placem.at/people?w=500"), placeholderImage: UIImage(named: "default_featured_image"))
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
}

extension ExperienceViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        self.tableView.reloadData()
        guard let searchText = searchController.searchBar.text else {
            return
        }
        self.viewModel?.getFilteredData(searchText)
        
//        for data in filteredArray{
//            print(data.name ?? "")
//        }
//
        self.tableView.reloadData()
        
    }
        // print(searchText)
}
