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
        
        view.backgroundColor = UIColor(red:0.98, green:0.93, blue:0.85, alpha:1)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("goalsCell") as! GoalsCell
        cell.textLabel?.text = AppData.sharedInstance.goals[indexPath.row].description
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
