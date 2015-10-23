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
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "InvestmentTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "Investment")
        self.enterpriseDetailsView.hidden = true
        self.blurView.hidden = true
        let topBarVC = TopBarViewController()
        self.addChildViewController(topBarVC)
        self.topBarViewContainer.addSubview(topBarVC.view)
        self.restorationIdentifier = "HighRiskInvestmentVC"
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Investment") as! InvestmentTableViewCell
        
        let enterprise = AppData.sharedInstance.enterprises[indexPath.row]
        
        cell.enterpriseName.text = enterprise.name
        cell.subtitleLabel.text = ""
        
        if ((AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(enterprise))){
            
            cell.subtitleLabel.text = NSString(format: "Value: %.2f ", (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(enterprise)?.currentValue)!) as String
        }
        
        cell.enterpriseImage.image = UIImage(named: enterprise.imageName)
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "High Risk Investments"
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.enterprises.count
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedEnterprise = AppData.sharedInstance.enterprises[indexPath.row]
        
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(selectedEnterprise)){

            let selectedInvestment = (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(selectedEnterprise) as! HighRiskInvestment)
            
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
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
