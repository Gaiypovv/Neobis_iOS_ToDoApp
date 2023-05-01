//
//  ToDoViewModel.swift
//  ToDoDemo
//
//  Created by Eldar Gaiypov on 26/4/23.
//

import Foundation
import RealmSwift


class ToDoViewModel: NSObject {
    static var sharedInstance = ToDoViewModel()
    var tasks = [Task]()
    
    typealias completionHandler = () -> Void
    
    let realm = try! Realm()
    
    func addTask(task: Task, completion: completionHandler) {
        self.realm.beginWrite()
        
        self.realm.add(task)
        
        try! self.realm.commitWrite()
        print("Task saved!")
        
        completion()
    }
    
    func edditTask(task: Task, updatedTask: Task, complation: completionHandler) {
        self.realm.beginWrite()
        
        //Delete old task
        self.realm.delete(task)
        
        //Add the updated task
        self.realm.add(updatedTask)
         
        try? self.realm.commitWrite()
        
        complation()
    }
    
    func deleteTask(task: Task, taskIndex: Int, completion: completionHandler) {
        self.realm.beginWrite()
        
        //Delete old task
        self.realm.delete(task)
         
        try? self.realm.commitWrite()
        
        tasks.remove(at: taskIndex)
        
        completion()     }
    
    func loadTasks(completion: completionHandler) {
        self.realm.beginWrite()
        
        let savedTasks = self.realm.objects(Task.self)
        self.tasks.removeAll()
        self.tasks.append(contentsOf: savedTasks)
        
        try! self.realm.commitWrite()
        completion()
    }
    
}
