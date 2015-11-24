//
//  InvestmentVC.swift
//  P.I.G
//
//  Created by Mayara Coelho on 11/9/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class SavingAccountVC: UIViewController {

    
   
    @IBOutlet weak var lowRiskInvestmentName: UILabel!
    
    @IBOutlet weak var lowRiskInvestmentDescript: UITextView!
    
    @IBOutlet weak var taxesTextLabel: UILabel!
    
    @IBOutlet weak var investmentValue: UILabel!
    
    @IBOutlet weak var investButton: UIButton!
    
    @IBOutlet weak var investmentSlider: UISlider!
    
    
    @IBOutlet weak var rescueButton: UIButton!
    
    @IBOutlet weak var rescueSlider: UISlider!
    
    @IBOutlet weak var rescueLabel: UILabel!
    
    
    var superViewController:LowRiskInvestmentsVC
    
    var lowRiskInvestment:LowRiskInvestment
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lowRiskInvestmentName.text = self.lowRiskInvestment.name
        self.lowRiskInvestmentDescript.text = self.lowRiskInvestment.descript
        self.taxesTextLabel.text = (self.lowRiskInvestment.taxes * 100).description + " de impostos sobre os lucros"
        
        self.investmentValue.text = NSString(format:"$ %.2f",0) as String
        self.rescueLabel.text = NSString(format:"$ %.2f",0) as String
        
        self.investmentSlider.value = 0.0
        self.rescueSlider.value = 0.0
        
        self.rescueButton.enabled = false
        self.investButton.enabled = false
        
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let deviceToken = delegate?.tabBarC
        deviceToken?.tabBarView.hidden = true
        // Do any additional setup after loading the view.
    }
    
    init(pSuperViewController:LowRiskInvestmentsVC, pLowRiskInvestment:LowRiskInvestment) {
        self.superViewController = pSuperViewController
        self.lowRiskInvestment = pLowRiskInvestment
        super.init(nibName: nil, bundle: nil)
    }
    
    @IBAction func investmentSliderChanged(sender: UISlider) {
        
        let value = (AppData.sharedInstance.player.balance * Double(self.investmentSlider.value))
        
       //If the player wants and have money to invest
        if (value > 0){
            self.investButton.enabled = true
        } else {
            self.investButton.enabled = false
        }
        
        self.investmentValue.text = NSString(format:"$ %.2f",value) as String
    
    }
    
    @IBAction func rescueSliderChanged(sender: UISlider) {
        if (self.lowRiskInvestment.currentValue == 0){
            self.rescueButton.enabled = false
        } else {
            let value = (self.lowRiskInvestment.currentValue * Double(self.rescueSlider.value))
            self.rescueLabel.text = NSString(format:"$ %.2f",value) as String
            self.rescueButton.enabled = true
        }
        
    }
    
    
    
    @IBAction func investButtonAct(sender: UIButton) {
        let value = (AppData.sharedInstance.player.balance * Double(self.investmentSlider.value))
        if (self.lowRiskInvestment.id == 1){
            AppData.sharedInstance.lowRiskInvestmentManager.applyInSavingAccount(value)
        }
        
        self.closePopView()
    }
    
    
    
    @IBAction func rescueButtonAct(sender: UIButton) {
        let value = (self.lowRiskInvestment.currentValue * Double(self.rescueSlider.value))
        print("VALUE: \(value)")
        AppData.sharedInstance.lowRiskInvestmentManager.rescueFromSavingAccount(value)
        self.closePopView()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func exitButtonAct(sender: UIButton) {
        self.closePopView()
    }
    
    func closePopView(){
        self.superViewController.blurView.hidden = true
        self.superViewController.popWindowView.hidden = true
        self.superViewController.viewDidLoad()
        self.superViewController.tableView.reloadData()
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
