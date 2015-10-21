//
//  InvestmentNotMadeVC.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 16/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class InvestmentNotMadeVC: UIViewController {
    
    @IBOutlet weak var enterpriseName: UILabel!
    
    @IBOutlet weak var enterpriseDescription: UITextView!
    
    @IBOutlet weak var enterpriseValueLabel: UILabel!
    
    @IBOutlet weak var investmentValueLabel: UILabel!
    
    @IBOutlet weak var investmentValueSlider: UISlider!
    
    @IBOutlet weak var investmentButton: UIButton!
    
    
    var enterprise:Enterprise
    var homeViewController:HighRiskInvestmentsVC
    

    init(pEnterprise:Enterprise, pHomeViewController:HighRiskInvestmentsVC) {
        self.enterprise = pEnterprise
        self.homeViewController = pHomeViewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.enterpriseName.text = self.enterprise.name
        
        self.enterpriseDescription.text = self.enterprise.descript
        
        self.enterpriseValueLabel.text = self.enterprise.value.description
        
        self.investmentValueLabel.text = "$ 0"
        
        self.investmentButton.enabled = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        if (self.investmentValueSlider.value > 0){
            self.investmentButton.enabled = true
        } else {
            self.investmentButton.enabled = false
        }
        
        let str = (AppData.sharedInstance.player.balance * Double(self.investmentValueSlider.value)).description
        var strsplit = str.characters.split{$0 == "."}.map(String.init)
        self.investmentValueLabel.text = "$ " + strsplit[0]
        
        let value = (AppData.sharedInstance.player.balance * Double(self.investmentValueSlider.value))
        
        self.investmentValueLabel.text = NSString(format:"$ %.2f",value) as String
        
    }
    
    @IBAction func investButtonAct(sender: UIButton) {
        let investmentValue = (AppData.sharedInstance.player.balance * Double(self.investmentValueSlider.value))
        AppData.sharedInstance.investmentManager.applyInHighRiskInvestment(self.enterprise, pValue: investmentValue)
        self.closePopUpScreen()
        PlayerDAO.sharedInstance.savePlayer()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonAct(sender: UIButton) {
     self.closePopUpScreen()
    }
    
    func closePopUpScreen(){
        self.homeViewController.enterpriseDetailsView.hidden = true
        self.homeViewController.blurView.hidden = true
        self.homeViewController.viewDidLoad()
        self.homeViewController.tableView.reloadData()
        self.view.removeFromSuperview()
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
