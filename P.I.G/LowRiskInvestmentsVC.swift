//
//  LowRiskInvestmentsVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class LowRiskInvestmentsVC: UIViewController {
    
    @IBOutlet weak var savingAccount: UIImageView!
    @IBOutlet weak var minSavingAccount: UILabel!
    @IBOutlet weak var maxSavingAccount: UILabel!
    @IBOutlet weak var inSavingAccount: UILabel!
    @IBOutlet weak var investSavingButton: UIButton!
    @IBOutlet weak var savingSlider: UISlider!
    @IBOutlet weak var savingInvestButton: UIButton!
    @IBOutlet weak var valueInvestSaving: UILabel!
    
    @IBOutlet weak var certificateOfDeposit: UIImageView!
    @IBOutlet weak var minCertificate: UILabel!
    @IBOutlet weak var inCertificate: UILabel!
    @IBOutlet weak var maxCertificate: UILabel!
    @IBOutlet weak var investCertificatrButton: UIButton!
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
        
        self.minSavingAccount.text = " $ 0"
        self.maxSavingAccount.text = " $ 1000"
        self.savingInvestButton.enabled = false
        
        self.minCertificate.text = " $ 0"
        self.maxCertificate.text = " $ 1000"
        self.certificateInvestButton.enabled = false
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderSaving(sender: AnyObject)
    {
        if (self.savingSlider.value > 0)
        {
            self.investSavingButton.enabled = true
        }
        else
        {
            self.investSavingButton.enabled = false
        }
        
        //        self.valueInvestSaving.text =
        
    }
    
    @IBAction func sliderCertificate(sender: AnyObject) {
        
        //        self.valueInvestSaving.text = NSString(format: "$ %.2f ", args: CVarArgType...)
        
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
