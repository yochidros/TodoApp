//
//  CompleteViewController.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/15.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var completeTableView: UITableView!
//    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let data = DataManager.share
    override func viewDidLoad() {
        super.viewDidLoad()
        completeTableView.delegate = self
        completeTableView.dataSource = self
        
        //データ読み込み
        DataManager.share.readData(key: "completeList")
    }
    override func viewDidAppear(_ animated: Bool) {
        completeTableView.reloadData()
    }


    //cellのカウント
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.share.completeList.count
    }
    //cellの追加
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let completeCell = tableView.dequeueReusableCell(withIdentifier: "completeCell" ,for: indexPath) as! CustomTableViewCell
        let comptask = DataManager.share.completeList[indexPath.row].getTaskStatus()
        completeCell.setCompleteCell(taskTitle: DataManager.share.completeList[indexPath.row].getTitle(),prog: comptask,completeDate:DataManager.share.completeList[indexPath.row].getCompleteDate())
        return completeCell
    }
   
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Deleteボタン.
        let myDeleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "Delete") { (action, index) -> Void in
            DataManager.share.completeList.remove(at: indexPath.row)
            //データの保存
            let data = DataManager.share.EncodeData(item: DataManager.share.completeList)
            DataManager.share.saveData(data: data, key: "completeList")
        
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            tableView.isEditing = false
            print("delete")
            tableView.reloadData()

        }
        myDeleteButton.backgroundColor = UIColor.red
        return [myDeleteButton]
    }
}
