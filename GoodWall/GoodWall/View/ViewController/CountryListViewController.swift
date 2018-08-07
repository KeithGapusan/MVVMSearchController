//
//  CountryListViewController.swift
//  GoodWall
//
//  Created by Keith Gapusan on 07/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var contryViewModel: CountryViewModel?
    var cellCountryTableViewCell : CountryTableViewCell!
    var searchController =  UISearchController()
    var filteredArray = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        
        contryViewModel = CountryViewModel.shared
        contryViewModel?.fetchAllCountryData({ error , message in
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else{
                print("finishFetching")
                self.tableView.reloadData()
            }
        })
    }
    
    func initTableView(){
        cellCountryTableViewCell = CountryTableViewCell()
        cellCountryTableViewCell?.registerNib(tableView: self.tableView)
        self.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.barStyle = UIBarStyle.black
            controller.searchBar.barTintColor = UIColor.white
            controller.searchBar.backgroundColor = UIColor.clear
            self.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
        self.tableView.tableHeaderView = searchController.searchBar
    }

}


extension CountryListViewController : UITableViewDelegate ,  UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
            return (contryViewModel?.numberOfRowsInSection(searchIsActive: searchController.isActive)) ?? 0
    
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellCountryTableViewCell.getCellId(), for: indexPath)  as?  CountryTableViewCell{
          
                cell.textLabel?.text = contryViewModel?.getDataAtRow(indexPath.row,  isActive: searchController.isActive).name ?? ""
        
           
            return cell
        }else{
            return UITableViewCell()
        }
    }

}
extension CountryListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        self.tableView.reloadData()
        guard let searchText = searchController.searchBar.text else {
            return
        }
        self.contryViewModel?.getFilteredData(searchText)
        
                for data in filteredArray{
                    print(data.name ?? "")
                }

        self.tableView.reloadData()
        
      
        // print(searchText)
    }
    
    
}
