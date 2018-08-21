//
//  CommentViewController.swift
//  GoodWall
//
//  Created by Keith Randell Gapusan on 20/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cellComment : CommentCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func initTableView(){
        cellComment = CommentCell()
        cellComment?.registerNib(tableView: self.tableView)
      

        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 607
    }
    
}
extension CommentViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellComment.getCellId(), for: indexPath)  as?  CommentCell{
            cell.lblComment.text = "sdas "
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
}
