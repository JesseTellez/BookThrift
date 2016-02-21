//
//  MajorDetailVC.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/21/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import Foundation

class MajorDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewz: UITableView!

    var universityArray = [University]()
    var inSearchMode = false
    var filteredUniversityArray = [University]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewz.delegate = self
        tableViewz.dataSource = self
        
        self.navigationController?.navigationBarHidden = false
        
        parseUniversityCSV()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationController?.navigationItem.title = "Home"
        self.navigationController?.navigationBar.topItem?.title = "Universities"
    }
    
    func parseUniversityCSV () {
        let pathz = NSBundle.mainBundle().pathForResource("Universities", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: pathz)
            let rows = csv.rows
            
            for row in rows {
                let name = row["Name"]!
                let Id = Int(row["ide"]!)!
                
                let university2 = University(name: name, id: Id)
                universityArray.append(university2)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("uniCell", forIndexPath: indexPath) as? UniCell {
            let uni: University!
            
            if inSearchMode {
                uni = filteredUniversityArray[indexPath.row]
            }
            else {
                uni = universityArray[indexPath.row]
            }
            
            cell.configureCell(uni)
            return cell
        }else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let uni: University!
        if inSearchMode {
            uni = filteredUniversityArray[indexPath.row]
        }else {
            uni = universityArray[indexPath.row]
        }
        
        performSegueWithIdentifier("toBooks", sender: uni)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredUniversityArray.count
        }else {
            return universityArray.count
        }
    }
    
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

    
}
