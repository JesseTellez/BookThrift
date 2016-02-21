//
//  UniversityVC.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/20/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import Foundation

class UniversityVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var universityArray = [University]()
    var inSearchMode = false
    var filteredUniversityArray = [University]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        
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
        
        performSegueWithIdentifier("toMajors", sender: uni)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredUniversityArray.count
        }else {
            return universityArray.count
        }
    }

    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        }
        else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredUniversityArray = universityArray.filter({$0.name.rangeOfString(lower) != nil})
            //refresh collection view
            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
