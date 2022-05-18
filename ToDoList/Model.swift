//
//  Model.swift
//  ToDoList
//
//  Created by Ivan Tolkunov on 06.05.2022.
//

import Foundation

var ToDoItems: [[String : Any]]{
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String : Any]] {
            return array
        } else {
            return []
        }
    }
    
}

func addItem(item: String, isDone: Bool = false) {
    ToDoItems.append(["Name": item, "isDone": isDone])
}

func removeItem(at itemIndex: Int) {
    ToDoItems.remove(at: itemIndex)
}

func changeState(at itemIndex: Int) -> Bool {
    ToDoItems[itemIndex]["isDone"] = !(ToDoItems[itemIndex]["isDone"] as! Bool)
    
    return ToDoItems[itemIndex]["isDone"] as! Bool
}
func changeItemPosition(fromIndex: Int, toIndex: Int) {
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)
}
