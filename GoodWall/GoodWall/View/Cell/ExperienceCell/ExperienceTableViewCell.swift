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
    
    public static let shared = ExperienceTableViewCell()
    
    
    var disposeBag = DisposeBag()
    let commentCell =  CommentCell()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    

    
    func configureCelll(_ data: Experience, row : Int,  searchController : UISearchController ,  cell: ExperienceTableViewCell , viewModel:ExperienceViewModel) -> ExperienceTableViewCell{
   
        cell.lblTitle.text = data.title ?? ""
        cell.lblDate.text = data.startDate ?? ""
        cell.lblDetails.text = data.body ?? ""
        cell.btnComments.setTitle("View \(String(describing: data.comments.count )) comments.", for: .normal)
        cell.imgViewBanner.sd_setImage(with: URL(string: "http://lorempixel.com/400/200/"), placeholderImage: UIImage(named: "default_featured_image"))
        
        cell.imgUserProfile.sd_setImage(with: URL(string: "http://lorempixel.com/400/200/"), placeholderImage: UIImage(named: "default_featured_image"))
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        commentCell.registerNib(tableView: tableViewComments)
      
        tableViewComments.rowHeight = UITableViewAutomaticDimension
        tableViewComments.estimatedRowHeight = 60
    }

    func setCommentTableView(row : Int, filtered  : Variable<[ExperienceComment]>){
        tableViewComments.tag = row
        filtered.asObservable().bind(to: tableViewComments.rx.items(cellIdentifier: commentCell.getCellId(), cellType: CommentCell.self)){  indexPath , data, cell in
            cell.lblComment.text = data.body
        }.disposed(by: disposeBag)
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
