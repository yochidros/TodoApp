//
//  TodoItem.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/15.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import Foundation
import UIKit

//dataの保持、出し入れ
class ItemData:NSObject,NSCoding{
   
    private var text: String
    private var creteDate: Date
    private var workingDate: Date
    private var completeDate: Date
    private var taskStatus = TaskStatus.Verification.rawValue
    
    //未実装
    enum TaskStatus : String{
        case Verification = "未確認"
        case Working = "作業中"
        case Complete = "完了"
    }
  
   //イニシャライザ
    init(text:String , createDate: Date) {
        self.text = text
        self.creteDate = createDate
        self.workingDate = createDate
        self.completeDate = createDate
    }
    
    //setter
    public func setTaskStatus(taskStatus: String){
        self.taskStatus = taskStatus
    }
    public func setCompleteTask(){
        self.taskStatus = TaskStatus.Complete.rawValue
        
    }
    public func setTitle(text: String) {
        self.text = text
    }
    public func setWorkingDate(date:Date){
        self.workingDate = date
    }

    public func setCompleteDate(date:Date){
        self.completeDate = date
    }
    //getter
    
    public func getTaskStatus() -> String{
        return self.taskStatus
    }
    
    public func getTitle() -> String{
        return self.text
    }
       public func getWorkingDate() -> Date{
        return self.workingDate
    }
    public func getCompleteDate() -> Date{
        return self.completeDate
    }
    
    
    //エンコード・デコード
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.text , forKey:"text")
        aCoder.encode(self.creteDate, forKey:"createDate")
        aCoder.encode(self.workingDate, forKey:"workingDate")
        aCoder.encode(self.completeDate,forKey:"completeDate")
        aCoder.encode(self.taskStatus, forKey:"taskStatus")
    }
    required init?(coder aDecoder: NSCoder){
        text = (aDecoder.decodeObject(forKey: "text") as? String)!
        creteDate = (aDecoder.decodeObject(forKey: "createDate") as! Date)
        workingDate = (aDecoder.decodeObject(forKey: "workingDate") as! Date)
        completeDate = (aDecoder.decodeObject(forKey: "completeDate") as! Date)
        taskStatus = (aDecoder.decodeObject(forKey: "taskStatus") as? String)!
       
    }
    
}

