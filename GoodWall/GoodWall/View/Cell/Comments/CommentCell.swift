//
//  CommentCell.swift
//  GoodWall
//
//  Created by Keith Randell Gapusan on 20/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CommentCell: UITableViewCell {

    @IBOutlet weak var lblComment: UILabel!
    
    private(set) var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func getNib() -> UINib{
        return UINib(nibName: CommentCell.identifier, bundle: Bundle(for: CommentCell.self))
        
    }
    public func getCellId() -> String{
        return CommentCell.identifier
    }
    public func registerNib(tableView:UITableView){
        tableView.register(getNib(), forCellReuseIdentifier: getCellId())
    }
    static var identifier: String {
        return String(describing: self)
    }
}
