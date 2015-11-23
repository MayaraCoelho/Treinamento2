//
//  HomeViewController.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class HighRiskInvestmentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var enterpriseDetailsView: UIView!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var topBarViewContainer: UIView!
    
    var updateTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "HRInvestmentTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "HRICell")
        self.enterpriseDetailsView.hidden = true
        self.blurView.hidden = true
        let topBarVC = TopBarViewController()
        self.addChildViewController(topBarVC)
        self.topBarViewContainer.addSubview(topBarVC.view)
        self.restorationIdentifier = "HighRiskInvestmentVC"
        
        self.enterpriseDetailsView.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        self.enterpriseDetailsView.opaque = false
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        self.updateTimer.invalidate()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        self.updateTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HRICell") as! HRInvestmentTableViewCell
        
        let enterprise = AppData.sharedInstance.enterprises[indexPath.row]
        
        cell.enterpriseName.text = enterprise.name
        //cell.subtitleLabel.text = ""
        cell.containerView.hidden = true
        
        
        if ((AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(enterprise))){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(enterprise)
            
            cell.containerView.hidden = false
            let colorBarVC = ColorBarViewController()
        
            colorBarVC.view.frame = CGRectMake(0, 0, CGFloat(200), CGFloat(28))
            self.addChildViewController(colorBarVC)
            
            cell.containerView.addSubview(colorBarVC.view)
            
            colorBarVC.drawBar(Float((investment?.currentValue)!) / Float((investment?.investedValue)!))
            
            colorBarVC.textLabel.text = NSString(format: "%.2f ", (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(enterprise)?.currentValue)! - (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(enterprise)?.investedValue)!) as String
        }
        
        cell.enterpriseImage.image = enterprise.icon()
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "High Risk Investments"
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.enterprises.count
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedEnterprise = AppData.sharedInstance.enterprises[indexPath.row]
        
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(selectedEnterprise)){

            let selectedInvestment = (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(selectedEnterprise))!
            
            let investmentMadeInstance = InvestmentMadeVC(pInvestment: selectedInvestment, pHomeViewController: self)
            
            self.presentInvestmentMadeViewController(investmentMadeInstance)
            
        } else {
        
        let investmentNotMadeInstance = InvestmentNotMadeVC(pEnterprise: selectedEnterprise, pHomeViewController: self)

        self.presentInvestmentNotMadeViewController(investmentNotMadeInstance)
        
        }
    }
    

    func presentInvestmentNotMadeViewController(pViewController:InvestmentNotMadeVC){
        self.addChildViewController(pViewController)
        self.enterpriseDetailsView.hidden = false
        self.blurView.hidden = false
        self.enterpriseDetailsView.addSubview(pViewController.view)
    }
    
    
    func presentInvestmentMadeViewController(pViewController:InvestmentMadeVC){
        self.addChildViewController(pViewController)
        self.enterpriseDetailsView.hidden = false
        self.blurView.hidden = false
        self.enterpriseDetailsView.addSubview(pViewController.view)
    }
    
    
    func update(){
        print("updating HRI VIEW")
        self.tableView.reloadData()
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
