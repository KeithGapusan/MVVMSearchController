//
//  ExperienceTableViewCell.swift
//  GoodWall
//
//  Created by Keith Gapusan on 10/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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

}
