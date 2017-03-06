//
//  CustomTableViewCell.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/16.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var completeName: UILabel!
    @IBOutlet weak var progress2: UILabel!
    @IBOutlet weak var completeDateLabel: UILabel!
    @IBOutlet weak var todoCreateDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(taskTitle: String,prog: String,workingDate: Date){
        taskName.text = taskTitle
        progress.text = prog
        todoCreateDateLabel.text = String("\(workingDate)")
    }
    
    func setCompleteCell(taskTitle: String , prog: String,completeDate: Date){
        completeName.text = taskTitle
        progress2.text = prog
        completeDateLabel.text = String("\(completeDate)")
    }
    
}
