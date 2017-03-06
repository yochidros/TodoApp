//
//  ViewController.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/14.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var todoListTable: UITableViewCell!
    @IBOutlet weak var createDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //データ読み込み
        DataManager.share.readData(key:"todoList")
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    //cellのカウント
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.share.todoList.count
    }

    //cellの追加
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" ,for: indexPath) as! CustomTableViewCell
        let task = DataManager.share.todoList[indexPath.row].getTaskStatus()
       cell.setCell(taskTitle: DataManager.share.todoList[indexPath.row].getTitle(),prog: task, workingDate: DataManager.share.todoList[indexPath.row].getWorkingDate())

        return cell
    }

    //完了,削除ボタンを押した時の処理
    // Buttonを拡張する.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        // completeボタン.
        let myArchiveButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "complete") { (action, index) -> Void in
            //進捗状況の更新（完了）
            DataManager.share.todoList[indexPath.row].setCompleteDate(date:NSDate() as Date)
            DataManager.share.todoList[indexPath.row].setCompleteTask()
            //完了リストに保存
            DataManager.share.setItemData(data: DataManager.share.todoList[indexPath.row], key: "completeList", listNumber: 2)
            // todoリストから削除
            DataManager.share.todoList.remove(at: indexPath.row)
            //todoListデータ保存
            let todoData = DataManager.share.EncodeData(item: DataManager.share.todoList)
            DataManager.share.saveData(data: todoData, key: "todoList")
            
            // セルの削除
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            tableView.isEditing = false
            tableView.reloadData()
        }
        myArchiveButton.backgroundColor = UIColor.blue

        // Delete ボタン.
        let myDeleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "Delete") { (action, index) -> Void in
            // 対応データの削除
            DataManager.share.todoList.remove(at: indexPath.row)
            let data:Data = NSKeyedArchiver.archivedData(withRootObject: DataManager.share.todoList) as Data
            DataManager.share.saveData(data: data, key: "todoList")
            // セルの削除
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            tableView.isEditing = false
            print("delete")
            tableView.reloadData()

        }
        myDeleteButton.backgroundColor = UIColor.red

        return [myArchiveButton, myDeleteButton]
    }

    //cell選択した時に編集画面へ遷移する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        DataManager.share.todoIndex = indexPath.row
        performSegue(withIdentifier: "EditViewController",sender: nil)
    }


}
