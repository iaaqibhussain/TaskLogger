//
//  TaskDetailViewController.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 23/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var presenter: TaskDetailPresenterProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.showDetail()
    }


}

extension TaskDetailViewController: TaskDetailViewProtocol {
    
    func showTask(_ task: TaskItem) {
        titleLabel.text = task.title
        descriptionTextView.text = task.description
    }
    
 
}
