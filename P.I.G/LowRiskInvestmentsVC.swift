//
//  LowRiskInvestmentsVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class LowRiskInvestmentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var topBarContainverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "LRInvestmentTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "LRICell")
        
        
        let topBarVC = TopBarViewController()
        self.addChildViewController(topBarVC)
        self.topBarContainverView.addSubview(topBarVC.view)
        self.restorationIdentifier = "LowRiskInvestmentVC"
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LRICell") as! LRInvestmentTableViewCell
        cell.textLabel?.text = "Hello world!"
        return cell
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Low Risk Investments"
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
