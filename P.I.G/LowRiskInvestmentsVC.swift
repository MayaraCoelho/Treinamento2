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
        
        self.popWindowView.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        self.popWindowView.opaque = false
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LRICell") as! LRInvestmentTableViewCell
    
        cell.LowRiskInvestName.text = AppData.sharedInstance.player.lowRiskInvestments[indexPath.row].name
        cell.LowRiskInvestValue.text = NSString(format: "Value : %.2f ",AppData.sharedInstance.player.lowRiskInvestments[indexPath.row].currentValue) as String
        cell.lowRiskInvestImage.image = AppData.sharedInstance.player.lowRiskInvestments[indexPath.row].icon()
        return cell
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Low Risk Investments"
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.player.lowRiskInvestments.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.popWindowView.hidden = false
        self.blurView.hidden = false
        let popVC = LRIMade(pSuperViewController: self, pLowRiskInvestment: AppData.sharedInstance.player.lowRiskInvestments[indexPath.row])
        self.addChildViewController(popVC)
        self.popWindowView.addSubview(popVC.view)
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
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
