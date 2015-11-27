//
//  LowRiskInvestmentsVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class LowRiskInvestmentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var lriLabel: UILabel!
    @IBOutlet weak var lriTitle: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topBarContainverView: UIView!
    @IBOutlet weak var popWindowView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    var updateTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "LRInvestmentTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "LRICell")
        
        let topBarVC = TopBarViewController()
        self.addChildViewController(topBarVC)
        self.topBarContainverView.addSubview(topBarVC.view)
        self.restorationIdentifier = "LowRiskInvestmentVC"
        
        lriLabel.text = NSLocalizedString("lri", comment: "")
        
        self.blurView.hidden = true
        self.popWindowView.hidden = true
        
        self.popWindowView.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        self.popWindowView.opaque = false
        
        tableView.backgroundColor = UIColor(red:0.98, green:0.91, blue:0.81, alpha:1)
        topBarContainverView.backgroundColor = UIColor(red:0.98, green:0.93, blue:0.85, alpha:1)
     
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let deviceToken = delegate?.tabBarC
        deviceToken?.tabBarView.hidden = false
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        self.updateTimer.invalidate()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        self.updateTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    func update(){
        print("updating LRI VIEW")
        self.tableView.reloadData()
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LRICell") as! LRInvestmentTableViewCell
    
        cell.LowRiskInvestName.text = AppData.sharedInstance.player.lowRiskInvestments[indexPath.row].name
        cell.LowRiskInvestValue.text = NSString(format: NSLocalizedString("value", comment: "") + ": %.2f ",AppData.sharedInstance.player.lowRiskInvestments[indexPath.row].currentValue) as String
        cell.lowRiskInvestImage.image = AppData.sharedInstance.player.lowRiskInvestments[indexPath.row].icon()
        return cell
    }
    
    
    /* func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Low Risk Investments"
    } */
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.player.lowRiskInvestments.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.popWindowView.hidden = false
        self.blurView.hidden = false
        var popVC = UIViewController()
        
        if (indexPath.row == 0){//SAVING ACCOUNT
            
            popVC = SavingAccountVC(pSuperViewController: self, pLowRiskInvestment: AppData.sharedInstance.player.lowRiskInvestments[indexPath.row])
            self.addChildViewController(popVC)
            self.popWindowView.addSubview(popVC.view)
            
        } else if (indexPath.row == 1){//CDB
            
            if (AppData.sharedInstance.player.lowRiskInvestments[AppData.sharedInstance.player.lowRiskInvestmentIndexByID(2)].currentValue == 0){
                popVC = CDBNotMadeVC(pSuperViewController: self, pLowRiskInvestment: AppData.sharedInstance.player.lowRiskInvestments[indexPath.row])
            } else {
                popVC = CDBMade(pSuperViewController: self, pLowRiskInvestment: AppData.sharedInstance.player.lowRiskInvestments[indexPath.row])
            }
        }
        
        
        self.addChildViewController(popVC)
        self.popWindowView.addSubview(popVC.view)
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
