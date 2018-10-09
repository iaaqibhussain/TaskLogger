//
//  TaskListRouter.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 30/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class TaskListRouter: TaskListRouterProtocol {
    
    func presentTaskListDetail(from view: TaskListViewProtocol, for task: TaskItem) {
        guard
            let tasklistViewController = view as? UIViewController,
            let taskDetail = TaskDetailRouter.getTaskDetailRouter(with: task) else {
            return
        }
        tasklistViewController.navigationController?.pushViewController(taskDetail, animated: true)
    }
    
}
