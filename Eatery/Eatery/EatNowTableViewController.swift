//
//  EatNowTableViewController.swift
//  Eatery
//
//  Created by Eric Appel on 11/3/14.
//  Copyright (c) 2014 CUAppDev. All rights reserved.
//

import UIKit

class EatNowTableViewController: UITableViewController {
    
    override func viewDidLoad() {
		super.viewDidLoad()

        var nib = UINib(nibName: "EatNowTableViewCell", bundle: nil)        
        tableView.registerNib(nib, forCellReuseIdentifier: "eatNowCell")
        tableView.rowHeight = 95

        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "search:"), animated: true)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sort By", style: UIBarButtonItemStyle.Plain, target: self, action: "sortBy:")
        
        DataManager.sharedInstance.loadTestData()
        print(DataManager.sharedInstance.diningHalls)
    }
    
    // MARK: - Actions
    
    func sortBy(sender: UIBarButtonItem) {
        let sortByViewController = SortByTableViewController()
        let navController = UINavigationController(rootViewController: sortByViewController)
        
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    func search(sender: UIBarButtonItem) {
        println("Search Not Implemented")
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diningHalls.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eatNowCell", forIndexPath: indexPath) as EatNowTableViewCell

        let name = diningHalls[indexPath.row].name
        let summary = diningHalls[indexPath.row].summary
        let paymentMethods = diningHalls[indexPath.row].paymentMethods
        let hours = diningHalls[indexPath.row].hours
        
        cell.loadItem(image: "appel.jpg", name: "Northstar Cafe", desc: "Appel Commons", loc: "poop", paymentMethods: ["Cornell Card", "Cash"], hours: "Open from 8 to 9")
        
        return cell
        //cell.textLabel.text = "Cell (\(indexPath.section),\(indexPath.row))"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController =  EatNowDetailViewController(nibName: "EatNowDetailViewController", bundle: nil)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
