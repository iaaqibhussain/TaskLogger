//
//  TaskListInteractor.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 30/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class TaskListInteractor: TaskListPresenterToInteractorProtocol {
    
    var presenter: TaskListInteractorToPresenterProtocol?
    
    var tasksManager = TasksManager.shared
    var tasks: [TaskItem] {
        return tasksManager.tasks
    }
    
    func fetchTasks() {
        presenter?.didFetchTasks(tasks)
    }
    
    func saveTask(_ task: TaskItem) {
        if task.title.isEmpty {
            presenter?.onError(message: "Title cannot be empty")
        } else {
            tasksManager.tasks.append(task)
            presenter?.didAddTask(task)
        }
    }
    
    func updateTask(_ index: Int, title: String, description: String?) {
        if title.isEmpty {
            presenter?.onError(message: "Title cannot be empty")
        } else {
            let task = TaskItem(title: title, description: description)
            tasksManager.tasks[index] = task
            presenter?.didEditTasks()
        }
    }
    
    func deleteTask(_ index: Int) {
        tasksManager.tasks.remove(at: index)
        presenter?.didRemoveTask(index)
    }
    
}
