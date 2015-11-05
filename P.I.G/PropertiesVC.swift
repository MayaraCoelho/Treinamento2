//
//  PropertiesVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class PropertiesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topBarContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let topbarVC = TopBarViewController()
        self.addChildViewController(topbarVC)
        self.topBarContainerView.addSubview(topbarVC.view)
        self.restorationIdentifier = "PropertiesVC"
        
        
        let nib = UINib.init(nibName: "PropertiesTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "PropertiesCell")
//        self.enterpriseDetailsView.hidden = true
//        self.blurView.hidden = true


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PropertiesCell") as! PropertiesTableViewCell
        
        let property = AppData.sharedInstance.properties[indexPath.row]
        
        cell.propertyName.text = property.name
        //cell.subtitleLabel.text = ""
//        cell.propertyImage.hidden = true
        
//        
//        if ((AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(enterprise))){
//            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(enterprise)
        
//            cell.containerView.hidden = false
            let colorBarVC = ColorBarViewController()
            
            colorBarVC.view.frame = CGRectMake(0, 0, CGFloat(200), CGFloat(28))
            self.addChildViewController(colorBarVC)
            
//            cell.containerView.addSubview(colorBarVC.view)
//            
//            colorBarVC.drawBar(Float((investment?.currentValue)!) / Float((investment?.investedValue)!))
//            
//            colorBarVC.textLabel.text = NSString(format: "W/L: %.2f ", (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(enterprise)?.currentValue)! - (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(enterprise)?.investedValue)!) as String
        
    
        cell.propertyImage.image = UIImage(named: property.imageName)
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Properties"
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.properties.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        let selectedEnterprise = AppData.sharedInstance.properties[indexPath.row]
        
//        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(selectedEnterprise)){
//            
//            let selectedInvestment = (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(selectedEnterprise))!
//            
//            let investmentMadeInstance = InvestmentMadeVC(pInvestment: selectedInvestment, pHomeViewController: self)
//            
//            self.presentInvestmentMadeViewController(investmentMadeInstance)
//            
//        } else {
//            
//            let investmentNotMadeInstance = InvestmentNotMadeVC(pEnterprise: selectedEnterprise, pHomeViewController: self)
//            
//            self.presentInvestmentNotMadeViewController(investmentNotMadeInstance)
//            
//        }
    }
//
//    
//    func presentInvestmentNotMadeViewController(pViewController:InvestmentNotMadeVC){
//        self.addChildViewController(pViewController)
//        self.enterpriseDetailsView.hidden = false
//        self.blurView.hidden = false
//        self.enterpriseDetailsView.addSubview(pViewController.view)
//    }
//    
//    
//    func presentInvestmentMadeViewController(pViewController:InvestmentMadeVC){
//        self.addChildViewController(pViewController)
//        self.enterpriseDetailsView.hidden = false
//        self.blurView.hidden = false
//        self.enterpriseDetailsView.addSubview(pViewController.view)
//    }
//    
    
    func update(){
        self.viewDidLoad()
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



