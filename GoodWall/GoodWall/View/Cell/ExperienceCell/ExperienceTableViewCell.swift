//
//  ExperienceTableViewCell.swift
//  GoodWall
//
//  Created by Keith Gapusan on 10/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ExperienceTableViewCell: UITableViewCell {

    var storedOffsets = [Int: CGFloat]()
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btnFollowMessage: UIView!
    @IBOutlet weak var imgViewBanner: UIImageView!
    
    
    @IBOutlet weak var btnCongrats: UIButton!
    @IBOutlet weak var btnLove: UIButton!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblDetails: UILabel!
    
    @IBOutlet weak var tableViewComments: UITableView!
    @IBOutlet weak var lblNumberOfDays: UILabel!
    
    @IBOutlet weak var btnComments: UIButton!
    private(set) var disposeBag = DisposeBag()
     let commentCell =  CommentCell()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    
    public static let shared = ExperienceTableViewCell()
    
    func configureCelll(_ data: Experience, row : Int,  searchController : UISearchController ,  cell: ExperienceTableViewCell , viewModel:ExperienceViewModel) -> ExperienceTableViewCell{
   
        cell.lblTitle.text = data.title ?? ""
        cell.lblDate.text = data.startDate ?? ""
        cell.lblDetails.text = data.body ?? ""
        cell.btnComments.setTitle("View \(String(describing: data.comments.count )) comments.", for: .normal)
        cell.imgViewBanner.sd_setImage(with: URL(string: "https://placemat.imgix.net/placeholder_images/images/000/000/159/original/eDLHCtzRR0yfFtU0BQar_sylwiabartyzel_themap.jpg?ixlib=rb-1.0.0&w=250&h=&fm=auto&crop=faces%2Centropy&fit=crop&txt=250%C3%97&txtclr=BFFF&txtalign=middle%2Ccenter&txtfit=max&txtsize=42&txtfont=Avenir+Next+Demi%2CBold&bm=multiply&blend=ACACAC&s=8e9e12d71cd9edf6cebb619c99760cd7"), placeholderImage: UIImage(named: "default_featured_image"))
        
        cell.imgUserProfile.sd_setImage(with: URL(string: "https://placem.at/people?w=500"), placeholderImage: UIImage(named: "default_featured_image"))
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        commentCell.registerNib(tableView: tableViewComments)
      
        tableViewComments.rowHeight = UITableViewAutomaticDimension
        tableViewComments.estimatedRowHeight = 60
    }

    func setCommentTableView(row : Int, filtered  : Variable<[ExperienceComment]>){
        //let filtered = viewModel.filteredComments.asObservable()
        tableViewComments.tag = row
        tableViewComments.reloadData()
          print("data23 == \(filtered.value.count)")
        filtered.asObservable().bind(to: tableViewComments.rx.items(cellIdentifier: commentCell.getCellId(), cellType: CommentCell.self)){  indexPath , data, cell in
            cell.lblComment.text = data.body
            }.disposed(by: disposeBag)
        tableViewComments.reloadData()
    }
    public func getNib() -> UINib{
        return UINib(nibName: ExperienceTableViewCell.identifier, bundle: Bundle(for: ExperienceTableViewCell.self))
        
    }
    public func getCellId() -> String{
        return ExperienceTableViewCell.identifier
    }
    public func registerNib(tableView:UITableView){
        tableView.register(getNib(), forCellReuseIdentifier: getCellId())
    }
    static var identifier: String {
        return String(describing: self)
    }
    var tableViewOffset: CGFloat {
        set { tableViewComments.contentOffset.x = newValue }
        get { return tableViewComments.contentOffset.x }
    }
}
