//
//  HomeViewController.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var enterprisesInstance = EnterpriseProperties()
    
    @IBOutlet weak var enterpriseDetailsView: UIView!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var enterpriseNameLabel: UILabel!
    
    @IBOutlet weak var enterpriseDescriptionLabel: UITextView!
    
    @IBOutlet weak var enterpriseMarketValueLabel: UILabel!
    
    @IBOutlet weak var invesmentValueSlider: UISlider!
    
    @IBOutlet weak var investingValue: UILabel!
    
    @IBOutlet weak var investButton: UIButton!
    
    @IBOutlet weak var myWalletLabel: UILabel!
    
    @IBOutlet weak var myIncomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "InvestmentTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "Investment")
        self.detailsViewClose()
        self.myWalletLabel.text = "Wallet: $ " + AppData.sharedInstance.player.balance.description
        self.myIncomeLabel.text = "Income: $ " + AppData.sharedInstance.player.income.description + " / day"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Investment") as! InvestmentTableViewCell
        
        let enterprise = self.enterprisesInstance.enterprises[indexPath.row]
        
        cell.enterpriseName.text = enterprise.name
        cell.subtitleLabel.text = ""
        
        if ((AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(enterprise))){
            cell.subtitleLabel.text = "Value $ " + (AppData.sharedInstance.player.highRiskInvestmentForEnterprise(enterprise)?.currentValue.description)!
        }
        
        
      
        cell.enterpriseImage.image = UIImage(named: enterprise.imageName)
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "High Risk Investments"
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enterprisesInstance.enterprises.count
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        

        
        let enterprise = self.enterprisesInstance.enterprises[indexPath.row]
        
        self.enterpriseNameLabel.text = enterprise.name
        
        self.enterpriseDescriptionLabel.text = enterprise.description
        self.enterpriseMarketValueLabel.text = "Market Value: " + enterprise.value.description
        self.detailsViewShow()
    }
    
    @IBAction func closeDetailsButonAct(sender: UIButton) {
        self.detailsViewClose()
    }

    
    func detailsViewShow(){
        self.enterpriseDetailsView.hidden = false
        self.enterpriseDetailsView.userInteractionEnabled = true
        self.blurView.hidden = false
        self.invesmentValueSlider.value = 0
        self.investingValue.text = "$ 0"
    }
    
    
    func detailsViewClose(){
        self.enterpriseDetailsView.hidden = true
        self.enterpriseDetailsView.userInteractionEnabled = false
        self.blurView.hidden = true
    }
    
    
    @IBAction func sliderValueChange(sender: UISlider) {
        let str = (AppData.sharedInstance.player.balance * Double(self.invesmentValueSlider.value)).description
        var strsplit = str.characters.split{$0 == "."}.map(String.init)
        self.investingValue.text = "$ " + strsplit[0]
        
    }
    

    @IBAction func investButtonAct(sender: UIButton) {
        
        let investmentValue = (AppData.sharedInstance.player.balance * Double(self.invesmentValueSlider.value))
        
        let enterprise =  self.enterprisesInstance.enterprises[(self.tableView.indexPathForSelectedRow?.row)!]
        
        AppData.sharedInstance.investmentManager.applyInHighRiskInvestment(enterprise, pValue: investmentValue)
        
        self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: false)
        self.detailsViewClose()
        self.tableView.reloadData()
        self.viewDidLoad()
    }
    
    
    @IBAction func goalsButtonAct(sender: UIButton) {
        
        for i:HighRiskInvestment in AppData.sharedInstance.player.highRiskInvestments {
            AppData.sharedInstance.investmentManager.rescueFromHighRiskInvestment(i.enterprise)
        }
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
