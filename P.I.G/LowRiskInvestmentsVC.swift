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
    
    @IBOutlet weak var popWindowView: UIView!
    
    var lowRiskInvestments = LRIProperties().arrayLRI
        
    @IBOutlet weak var blurView: UIVisualEffectView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "LRInvestmentTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "LRICell")
        
        
        let topBarVC = TopBarViewController()
        self.addChildViewController(topBarVC)
        self.topBarContainverView.addSubview(topBarVC.view)
        self.restorationIdentifier = "LowRiskInvestmentVC"
        
        self.blurView.hidden = true
        self.popWindowView.hidden = true
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LRICell") as! LRInvestmentTableViewCell
        cell.LowRiskInvestName.text = self.lowRiskInvestments[indexPath.row].name
        return cell
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Low Risk Investments"
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lowRiskInvestments.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.popWindowView.hidden = false
        self.blurView.hidden = false
        let popVC = LRIDetails(pSuperViewController: self)
        self.addChildViewController(popVC)
        self.popWindowView.addSubview(popVC.view)
        
        
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
