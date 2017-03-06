//
//  TodoItemManager.swift
//  miyazawa-todo
//
//  Created by 宮澤賢生 on 2016/12/16.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import Foundation

class TodoItemManager{
    var completeItem = [ItemData]()
    var todoList = [ItemData]()
    
    func setTodoList(item: ItemData){
        todoList.append(item)
    }
    func getTodoList() ->[ItemData]{
        return todoList
    }
    
    func setCompleteList(item: ItemData){
        completeItem.append(item)
    }
    
    func getCompleteList() ->[ItemData]{
        return completeItem
    }
    
}
