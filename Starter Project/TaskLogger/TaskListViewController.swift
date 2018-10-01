//
//  TaskListViewController.swift
//  TaskLogger
//
//  Created by Aaqib Hussain on 23/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: TableView Datasource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //MARK: TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
        }
        
        let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
        }
        edit.backgroundColor = UIColor.lightGray
        
        return [edit, delete]
        
    }

}
