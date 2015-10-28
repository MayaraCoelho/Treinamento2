//
//  LowRiskInvestmentsVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class LowRiskInvestmentsVC: UIViewController {
    
    
    @IBOutlet weak var inSavingAccount: UILabel!
    @IBOutlet weak var savingSlider: UISlider!
    @IBOutlet weak var savingInvestButton: UIButton!
    @IBOutlet weak var valueInvestSaving: UILabel!
    
    @IBOutlet weak var inCertificate: UILabel!
    @IBOutlet weak var certificateSlider: UISlider!
    @IBOutlet weak var certificateInvestButton: UIButton!
    @IBOutlet weak var valueInvestCertificate: UILabel!
    
    @IBOutlet weak var topBarContainverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topBarVC = TopBarViewController()
        self.addChildViewController(topBarVC)
        self.topBarContainverView.addSubview(topBarVC.view)
        self.restorationIdentifier = "LowRiskInvestmentVC"
        
        self.savingInvestButton.enabled = false
        self.certificateInvestButton.enabled = false
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderSaving(sender: AnyObject)
    {
        if ((AppData.sharedInstance.player.balance * Double(self.savingSlider.value)) > 0)
        {
            self.savingInvestButton.enabled = true
        }
        else
        {
            self.savingInvestButton.enabled = false
        }
        
        let value = (AppData.sharedInstance.player.balance * Double(self.savingSlider.value))
        self.valueInvestSaving.text = NSString(format: "$ %.2f", value) as String
    }
    
    
    @IBAction func investButtonSaving(sender: UIButton) {
        let investmentValue = (AppData.sharedInstance.player.balance * Double(self.savingSlider.value))
        AppData.sharedInstance.investmentManager.applyInSavingAccount(investmentValue)
        
    }
    
    
    @IBAction func sliderCertificate(sender: AnyObject) {
        
        
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
