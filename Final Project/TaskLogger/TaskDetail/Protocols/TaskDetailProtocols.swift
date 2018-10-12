//
//  TaskDetailProtocols.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 30/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

protocol TaskDetailViewProtocol: class {
    
    var presenter: TaskDetailPresenterProtocol? { get set }
    
    func showTask(_ task: TaskItem)
}

protocol TaskDetailPresenterProtocol: class {
    
    var view: TaskDetailViewProtocol? { get set }
    var interactor: TaskDetailPresenterToInteractorProtocol? { get set }
    
    func showDetail()
}

protocol TaskDetailPresenterToInteractorProtocol: class {
    var taskItem: TaskItem? { get set }
}

protocol TaskDetailRouterProtocol: class {
    
    static func getTaskDetailRouter(with task: TaskItem) -> UIViewController?
    
}
