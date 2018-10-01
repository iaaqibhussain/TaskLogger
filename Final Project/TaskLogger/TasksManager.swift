//
//  TasksManager.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 30/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class TasksManager: NSObject {

    private override init() { }
    
    static let shared = TasksManager()
    
    var tasks: [TaskItem] = [TaskItem(title: "Foucs", description: "Something"),
                             TaskItem(title: "Foucs", description: "Something"),
                             TaskItem(title: "Foucs", description: "Something")]
    
    
}
