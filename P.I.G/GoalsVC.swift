//
//  GoalsVC.swift
//  P.I.G
//
//  Created by Mayara Coelho on 11/12/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topBarView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topBar = TopBarViewController()
        addChildViewController(topBar)
        self.topBarView.addSubview(topBar.view)
        
        let nib = UINib.init(nibName: "GoalsCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "goalsCell")
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView(frame:CGRectZero)
        
        tableView.tableFooterView!.hidden = true
        tableView.backgroundColor = UIColor.clearColor()
        
        view.backgroundColor = UIColor(red:0.98, green:0.93, blue:0.85, alpha:1)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let goals = AppData.sharedInstance.goals[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("goalsCell") as! GoalsCell
        cell.textLabel?.text = goals.description
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.goals.count
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            AppData.sharedInstance.goals.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
            self.tableView.reloadData()
        }
    }
    
    
}
