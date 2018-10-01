//
//  TaskListViewController.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 23/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class TaskListViewController: UITableViewController {

    var presenter: TaskListPresenterProtocol?
    var tasks: [TaskItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        presenter?.getTasks()
    }
    
    //MARK: TableView Datasource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let tasks = self.tasks[indexPath.row]
        cell.textLabel?.text = tasks.title
        cell.detailTextLabel?.text = tasks.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    //MARK: TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        presenter?.showTaskDetail(task)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.presenter?.removeTask(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
           }
        
        let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            let task = self.tasks[indexPath.row]
            self.updateTask(index: indexPath.row, task: task)
        }
        edit.backgroundColor = UIColor.lightGray
        
        return [edit, delete]
        
    }
    
    //MARK: Functions
    
    private func setupPresenter() {
        presenter = TaskListPresenter()
        let interactor = TaskListInteractor()
        presenter?.interactor = interactor
        interactor.presenter = self.presenter as? TaskListInteractorToPresenterProtocol
        presenter?.router = TaskListRouter()
        presenter?.view = self
    }
    
    private func addTask() {
        let alertController = UIAlertController(title: "Add Task", message: "", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { [weak self] alert in
            let titleText = alertController.textFields![0].text ?? ""
            let descriptionText = alertController.textFields![1].text ?? "NA"
            let taskItem = TaskItem(title: titleText, description: descriptionText)
            self?.presenter?.addTask(taskItem)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func updateTask(index: Int, task: TaskItem) {
        let alertController = UIAlertController(title: "Update Task", message: "", preferredStyle: .alert)
        alertController.addTextField { $0.text = task.title }
        alertController.addTextField { $0.text = task.description }
        let updateAction = UIAlertAction(title: "Update", style: .default, handler: { [weak self] alert in
            let titleText = alertController.textFields![0].text ?? ""
            let descriptionText = alertController.textFields![1].text ?? "NA"
            self?.presenter?.editTask(index, title: titleText, description: descriptionText)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(updateAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        addTask()
    }

}

extension TaskListViewController: TaskListViewProtocol {

    func showTasks(_ tasks: [TaskItem]) {
        self.tasks = tasks
        tableView.reloadData()
    }
    
    func showMessage(_ message: String) {
        showAlert(message)
    }
    
}
