//
//  ViewController.swift
//  Neighbourhood-coreData
//
//  Created by Prateek Mahawar on 01/07/16.
//  Copyright © 2016 Prateek Mahawar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var post = [PostCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "PostCell")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.post = results as! [PostCell]
        } catch {
            print(NSError)
        }
    }
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostViewCell") as? PostViewCell {
            let postView = post[indexPath.row]
            cell.configureCell(postView)
            return cell
        } else {
            return PostViewCell()
        }
    }
}


