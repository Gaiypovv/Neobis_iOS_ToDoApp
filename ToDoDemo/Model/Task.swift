//
//  Task.swift
//  ToDoDemo
//
//  Created by Eldar Gaiypov on 26/4/23.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var dspt: String = ""
    
    override init() {
        super.init()
    }
    
    init(name: String, dspt: String) {
        self.name = name
        self.dspt = dspt
    }
}
