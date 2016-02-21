//
//  BackTableVC.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/20/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import Foundation


class BackTableVC: UITableViewController {
    
    var tableArray =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableArray = ["Home", "Log on", "Sell"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(tableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
            
            cell.textLabel?.text = tableArray[indexPath.row]
            return cell
    
    }
}