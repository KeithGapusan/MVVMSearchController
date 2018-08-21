//
//  ExperienceViewController.swift
//  GoodWall
//
//  Created by Keith Gapusan on 10/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit
import SDWebImage
import RxCocoa
import RxSwift

class ExperienceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var storedOffsets = [Int: CGFloat]()
    var viewModel : ExperienceViewModel!
    var cellExperienceTableViewCell : ExperienceTableViewCell!
    var searchController =  UISearchController()
    var disposeBag = DisposeBag()
   // let experience = Observable.just(viewModel.)
    var boundIndizes = [Int: Bool]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        viewModel = ExperienceViewModel.shared
        viewModel.fetchAllExpericeData { (error, message) in
            self.setupExpericenceCell()
            self.setupCellTapHandling()
        }
       
    }
    
    private func setupExpericenceCell() {
        viewModel.listExperience.asObservable().bind(to: tableView.rx.items(cellIdentifier: cellExperienceTableViewCell.getCellId(), cellType: ExperienceTableViewCell.self)){
            row , data, cell in
            self.configureCell(data, row: row, cell: cell, viewModel: self.viewModel)
            
            let filtered = self.viewModel.getDataCommentInRow(row)
            if filtered.value.count > 0 {
                cell.setCommentTableView(row: row, filtered: filtered)
                cell.tableViewOffset = self.storedOffsets[row] ?? 0
                 cell.tableViewComments.reloadData()
            }else{
                cell.tableViewComments.reloadData()
            }
           
       
        }.disposed(by: disposeBag)
    }
    
    
    func configureCell(_ data: Experience, row : Int ,  cell: ExperienceTableViewCell , viewModel:ExperienceViewModel){
        cell.lblTitle.text = data.title ?? ""
        cell.lblDate.text = data.startDate ?? ""
        cell.lblDetails.text = data.body ?? ""
        cell.btnComments.setTitle("View \(String(describing: data.comments.count )) comments.", for: .normal)
//        print(data.comments)
        cell.imgViewBanner.sd_setImage(with: URL(string: "https://placemat.imgix.net/placeholder_images/images/000/000/159/original/eDLHCtzRR0yfFtU0BQar_sylwiabartyzel_themap.jpg?ixlib=rb-1.0.0&w=250&h=&fm=auto&crop=faces%2Centropy&fit=crop&txt=250%C3%97&txtclr=BFFF&txtalign=middle%2Ccenter&txtfit=max&txtsize=42&txtfont=Avenir+Next+Demi%2CBold&bm=multiply&blend=ACACAC&s=8e9e12d71cd9edf6cebb619c99760cd7"), placeholderImage: UIImage(named: "default_featured_image"))
        
        cell.imgUserProfile.sd_setImage(with: URL(string: "https://placem.at/people?w=500"), placeholderImage: UIImage(named: "default_featured_image"))
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
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 800
    }
    
    
    private func setupCellTapHandling() {
      
        tableView.rx.modelSelected(Experience.self).subscribe( onNext: {experience in
            }).disposed(by: disposeBag)
    }

}



extension ExperienceViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        self.tableView.reloadData()
        guard let searchText = searchController.searchBar.text else {
            return
        }
        self.viewModel?.getFilteredData(searchText)
        self.tableView.reloadData()
        
    }
}
