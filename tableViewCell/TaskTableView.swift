//
//  TaskTableView.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/16.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit

class TaskTableView : UITableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        return cell
    }
}
