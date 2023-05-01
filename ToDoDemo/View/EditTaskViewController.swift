//
//  EditTaskViewController.swift
//  ToDoDemo
//
//  Created by Eldar Gaiypov on 26/4/23.
//

import UIKit

class EditTaskViewController: UIViewController {

    @IBOutlet weak var name : UITextField!
    @IBOutlet weak var dspt : UITextField!
    @IBAction func saveButton(_ sender: Any) {
        print("Saving ...")
        
        let newTask = Task(
            name: name.text ?? "", dspt: dspt.text ?? "")
        vm.edditTask(task: self.task!, updatedTask: newTask) {
            print("Task updated successfully")
            navigationController?.popViewController(animated: true)
            
        }
    }
    
    var task: Task?
    var index: Int?
              
    let vm = ToDoViewModel.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myTask = self.task {
            name.text = myTask.name
            dspt.text = myTask.dspt
        }
    }
    

}
