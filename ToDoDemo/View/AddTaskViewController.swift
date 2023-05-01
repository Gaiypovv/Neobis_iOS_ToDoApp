//
//  AddTaskViewController.swift
//  ToDoDemo
//
//  Created by Eldar Gaiypov on 26/4/23.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var txtTaskName: UITextField!
    @IBOutlet weak var dspt: UITextField!
    @IBAction func saveButton(_ sender: Any) {
        print("Saving task ...")
        
        let task = Task(name: txtTaskName.text ?? "", dspt: dspt.text ?? "")
        let vm = ToDoViewModel.sharedInstance
        vm.addTask(task: task) {
            self.navigationController?
                .popViewController(animated: true)
        }
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
