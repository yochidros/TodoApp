
//  DataManager.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/17.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit

//データの操作
class DataManager{
    var completeList = [ItemData]()
    var todoList = [ItemData]()
    var todoIndex: Int
    private var obj = [ItemData]()
    let userDefaults = UserDefaults.standard

    //singleton
    static let share = DataManager()
    private init(){
        self.todoList = []
        self.completeList = []
        self.todoIndex = 0
        self.obj = todoList
    }
  
    
    //todoListかまたはcompleteListを選ぶ
    public func selectObject(objectKey:String){
        switch objectKey {
        case "todoList":
            obj = DataManager.share.todoList
            break
        default:
            obj = DataManager.share.completeList
            break
        }
    }
    //データのエンコード
    func EncodeData(item: [ItemData]) -> Data{
        return NSKeyedArchiver.archivedData(withRootObject: item) as Data
    }
    //ItemDataをcellに追加、データの保存
    public func setItemData(data: ItemData,key:String,listNumber:Int){
        if (listNumber == 1){
            DataManager.share.todoList.append(data)
        }else if (listNumber == 2){
            
            DataManager.share.completeList.append(data)
        }
        selectObject(objectKey: key)

        let dat = EncodeData(item: obj)
        saveData(data: dat, key: key)
    }
    
//    データ保存
    public func saveData(data: Data,key: String){
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
        print("save sucessful")
    }
    
//データの読み込み
    public func readData(key: String) {
        if let data = userDefaults.object(forKey: key){
            print("load data \(key)")
            if let storeList = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as? [ItemData]{
                if( key == "todoList"){
                    DataManager.share.todoList = storeList
                }else{
                    DataManager.share.completeList = storeList
                }
            }
            else{print("load error")}
        }
    }
}
