//
//  ExperienceViewController.swift
//  GoodWall
//
//  Created by Keith Gapusan on 10/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

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


extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (viewModel?.numberOfRowsInSection(searchIsActive: searchController.isActive)) ?? 0
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellExperienceTableViewCell.getCellId(), for: indexPath)  as?  ExperienceTableViewCell{
            
            cell.textLabel?.text = viewModel?.getDataAtRow(indexPath.row,  isActive: searchController.isActive).name ?? ""
            
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
}
