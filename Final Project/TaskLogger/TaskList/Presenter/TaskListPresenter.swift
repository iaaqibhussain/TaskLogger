//
//  TaskListPresenter.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 30/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class TaskListPresenter: TaskListPresenterProtocol {
    
    var view: TaskListViewProtocol?
    var interactor: TaskListPresenterToInteractorProtocol?
    var router: TaskListRouterProtocol?
    
    func getTasks() {
        interactor?.fetchTasks()
    }
    
    func showTaskDetail(_ task: TaskItem) {
        guard let view = view else { return }
        router?.presentTaskListDetail(from: view, for: task)
    }
    
    func addTask(_ task: TaskItem) {
        interactor?.saveTask(task)
    }
    
    func editTask(_ index: Int, title: String, description: String?) {
        interactor?.updateTask(index, title: title, description: description)
    }
    
    func removeTask(_ index: Int) {
        interactor?.deleteTask(index)
    }
    

}

extension TaskListPresenter: TaskListInteractorToPresenterProtocol {
    
    func didAddTask(_ task: TaskItem) {
        interactor?.fetchTasks()
    }

    func didEditTasks() {
        interactor?.fetchTasks()
    }
    
    func didRemoveTask(_ index: Int) {
        interactor?.fetchTasks()
    }
    
    func didFetchTasks(_ tasks: [TaskItem]) {
        view?.showTasks(tasks)
    }

    func onError(message: String) {
        view?.showMessage(message)
    }
    
    
}
