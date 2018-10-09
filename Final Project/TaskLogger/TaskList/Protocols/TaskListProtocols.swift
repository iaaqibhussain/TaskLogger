//
//  TaskListProtocols.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 30/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

// MARK: VIEW

protocol TaskListViewProtocol: class {
    
    var presenter: TaskListPresenterProtocol? { get set }
    
    func showTasks(_ tasks: [TaskItem])
    func showMessage(_ message: String)
}

// MARK: PRESENTER

protocol TaskListPresenterProtocol: class {
    
    var view: TaskListViewProtocol? { get set }
    var interactor: TaskListPresenterToInteractorProtocol? { get set }
    var router: TaskListRouterProtocol? { get set }
    
    func getTasks()
    func showTaskDetail(_ task: TaskItem)
    func addTask(_ task: TaskItem)
    func editTask(_ index: Int, title: String, description: String?)
    func removeTask(_ index: Int)
}

// MARK: INTERACTOR

protocol TaskListPresenterToInteractorProtocol: class {
    
    var presenter: TaskListInteractorToPresenterProtocol? { get set }
    
    func fetchTasks()
    func saveTask(_ task: TaskItem)
    func updateTask(_ index: Int, title: String, description: String?)
    func deleteTask(_ index: Int)
}

protocol TaskListInteractorToPresenterProtocol: class {
    
    func didAddTask(_ task: TaskItem)
    func didRemoveTask(_ index: Int)
    func didFetchTasks(_ tasks: [TaskItem])
    func didEditTasks()
    func onError(message: String)
}

// MARK: ROUTER

protocol TaskListRouterProtocol: class {
    
    func presentTaskListDetail(from view: TaskListViewProtocol, for task: TaskItem)
}
