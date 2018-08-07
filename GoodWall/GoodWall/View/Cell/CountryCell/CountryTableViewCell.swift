//
//  CountryTableViewCell.swift
//  GoodWall
//
//  Created by Keith Gapusan on 07/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewFlag: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func getNib() -> UINib{
       return UINib(nibName: CountryTableViewCell.identifier, bundle: Bundle(for: CountryTableViewCell.self))
        
    }
    public func getCellId() -> String{
        return CountryTableViewCell.identifier
    }
    public func registerNib(tableView:UITableView){
        tableView.register(getNib(), forCellReuseIdentifier: getCellId())
    }
    static var identifier: String {
        return String(describing: self)
    }
}
