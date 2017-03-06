//
//  addTodo.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/14.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit


class AddTodo: UIViewController {    
    @IBOutlet weak var itemText: UITextField!
    @IBAction func tapScreen(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func addText(_ sender: Any) {
        //データ保存
        let itm = ItemData(text: itemText.text!,createDate: NSDate() as Date)
        DataManager.share.setItemData(data: itm, key: "todoList", listNumber: 1)
        itemText.text = ""
        goBackToRootnavigationView()
    }
    
    internal func goBackToRootnavigationView(){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
