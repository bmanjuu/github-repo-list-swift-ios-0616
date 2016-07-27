//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let dataStore = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataStore.getRepositoriesWithCompletion { 
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                print("Bloop")
            })
            
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
        
        self.tableView.accessibilityLabel = "tableView"
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataStore.repoArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        let repoDictionary = self.dataStore.repoArray[indexPath.row]
        
        if let name = repoDictionary.fullName {
            cell.textLabel?.text = String(name)
            //needed to add String() because name is NSString and not String 
        }
        
        return cell
    }
    
    
}
