//
//  ViewController.swift
//  ToDoDemo
//
//  Created by Eldar Gaiypov on 26/4/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    let vm = ToDoViewModel.sharedInstance
    
//        var bob : [Task] = [
//        Task(name: "Task 1", time: Date()),
//        Task(name: "Task 2", time: Date())
//        ]
//
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        self.data.removeAll()
        vm.loadTasks {
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tasks.count //data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = vm.tasks[indexPath.row]
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text = data.dspt
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController
        vc.task = vm.tasks[indexPath.row]
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        vm.tasks.swapAt(sourceIndexPath.row , destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    
    @IBAction func pencilTapSort() {
        if tableView.isEditing {
            tableView.isEditing = false
        }
        else {
            tableView.isEditing = true
        }
       
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            vm.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath ], with: .fade)
             
            tableView.endUpdates()
        }
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
     
   
}

