//
//  editViewController.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/14.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//
import UIKit


class StatusButton : UIButton{
    @IBInspectable var statusString : String = ""
}

class EditViewController: UIViewController {
    let list = DataManager.share.todoList
    let index = DataManager.share.todoIndex
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var presentStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presentStatus.text = list[index].getTaskStatus()
    }
    
    @IBAction func editAction(_ sender: Any) {
        if let text = editTextField.text {
            list[index].setTitle(text: text)
            list[index].setWorkingDate(date: NSDate()as Date)
            //保存
            DataManager.share.setItemData(data:DataManager.share.todoList[index], key: "todoList", listNumber: 0)
        }
        else{
            print("error")
        }
        goBackToRootnavigationView()
    }
    
    //前の画面に戻る
    func goBackToRootnavigationView(){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
   }
