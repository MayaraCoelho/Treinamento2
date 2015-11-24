//
//  InvestmentMadeVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 22/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class InvestmentMadeVC: UIViewController {
    
    @IBOutlet weak var enterpriseNameLabel: UILabel!
    
    @IBOutlet weak var enterpriseDescriptionLabel: UITextView!
    
    @IBOutlet weak var enterpriseValueLabel: UILabel!
    
    @IBOutlet weak var investedValueLabel: UILabel!
    
    @IBOutlet weak var initialInvestmentValueLabel: UILabel!
    
    @IBOutlet weak var investMoreLabel: UILabel!

    @IBOutlet weak var investButton: UIButton!
    
    @IBOutlet weak var investSlider: UISlider!
    
    @IBOutlet weak var rescueLabel: UILabel!
    
    @IBOutlet weak var rescueButton: UIButton!
    
    @IBOutlet weak var rescueSlider: UISlider!
    
    var homeViewController:HighRiskInvestmentsVC
    var investment:HighRiskInvestment
    let enterprise:Enterprise
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.enterpriseNameLabel.text = self.enterprise.name
        self.enterpriseDescriptionLabel.text = self.enterprise.descript
        self.enterpriseValueLabel.text = NSString(format: "Stock Value : %.2f",self.enterprise.stockValue) as String
        
        self.initialInvestmentValueLabel.text = NSString(format: "Initial Value: %.2f",self.investment.startingValue) as String
        
        self.investedValueLabel.text = NSString(format: "Current Value: %.2f",self.investment.currentValue) as String
        
        
        
        
        self.investMoreLabel.text = "Invest more: $ 0"
        self.investButton.enabled = false
        self.investSlider.value = 0
        
        self.rescueLabel.text = "Rescue: $ 0"
        self.rescueButton.enabled = false
        self.rescueSlider.value = 0
        
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let deviceToken = delegate?.tabBarC
        deviceToken?.tabBarView.hidden = true
        
        // Do any additional setup after loading the view.
    }
    
    init(pInvestment:HighRiskInvestment,  pHomeViewController:HighRiskInvestmentsVC) {
        self.investment = pInvestment
        self.homeViewController = pHomeViewController
        self.enterprise = AppData.sharedInstance.enterpriseByID(pInvestment.enterpriseID)!
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func investmentSliderValueChanged(sender: UISlider) {
        
        let value = (AppData.sharedInstance.player.balance * Double(self.investSlider.value))
        
        //If the player wants and have money to invest
        if (value > 0){
            self.investButton.enabled = true
        } else {
            self.investButton.enabled = false
        }
        
        self.investMoreLabel.text = NSString(format:"Invest More: $ %.2f",value) as String
    }
    
    @IBAction func investButtonAct(sender: UIButton) {
        let investmentValue = (AppData.sharedInstance.player.balance * Double(self.investSlider.value))
        AppData.sharedInstance.highRiskinvestmentManager.applyInHighRiskInvestment(self.enterprise, pValue: investmentValue)
        self.closePopUpScreen()
      //  PlayerDAO.sharedInstance.savePlayer()
    }
    
    
    @IBAction func rescueSliderValueChanged(sender: UISlider) {
        if (self.rescueSlider.value > 0){
            self.rescueButton.enabled = true
        } else {
            self.investButton.enabled = false
        }
        
        let value = self.investment.currentValue * Double(self.rescueSlider.value)
        self.rescueLabel.text = NSString(format: "Rescue: $ %.2f", value) as String
    }
    
    
    @IBAction func rescueButtonAct(sender: UIButton) {
        
        if (self.rescueSlider.value == 0){
            return
        } else {
            
            if (rescueSlider.value == 1){
                AppData.sharedInstance.highRiskinvestmentManager.rescueFromHighRiskInvestment(self.enterprise)
            } else {
        
                let rescueValue = self.investment.currentValue * Double(self.rescueSlider.value)
        
                AppData.sharedInstance.highRiskinvestmentManager.rescueFromHighRiskInvestment(self.enterprise, pValue: rescueValue)
            }
        
            self.closePopUpScreen()
          //  PlayerDAO.sharedInstance.savePlayer()
            
        }
    }
    
    
    
    @IBAction func closeViewButtonAct(sender: UIButton) {
        self.closePopUpScreen()
    }

    func closePopUpScreen(){
        self.homeViewController.enterpriseDetailsView.hidden = true
        self.homeViewController.blurView.hidden = true
        self.homeViewController.viewDidLoad()
        self.homeViewController.tableView.reloadData()
        self.view.removeFromSuperview()
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
