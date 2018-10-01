//
//  TaskDetailRouter.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 30/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class TaskDetailRouter: TaskDetailRouterProtocol {
    
    static func getTaskDetailRouter(with task: TaskItem) -> UIViewController? {
        guard let taskDetailViewController = storyboard.instantiateViewController(withIdentifier: String(describing: TaskDetailViewController.self))  as? TaskDetailViewController else {
            return nil
        }
        
        let presenter = TaskDetailPresenter()
        taskDetailViewController.presenter = presenter
        presenter.view = taskDetailViewController
        let interactor = TaskDetailInteractor()
        interactor.taskItem = task
        presenter.interactor = interactor
        let router = TaskDetailRouter()
        presenter.router = router
        
        return taskDetailViewController
    }
    
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    

}
