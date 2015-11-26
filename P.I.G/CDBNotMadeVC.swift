//
//  CDBNotMadeVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 24/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class CDBNotMadeVC: UIViewController {
    
    @IBOutlet weak var investmentNameLabel: UILabel!
    
    @IBOutlet weak var investmentDescriptionLabel: UITextView!
    
    @IBOutlet weak var investmentValue: UILabel!
    
    @IBOutlet weak var investmentSlider: UISlider!
    
    @IBOutlet weak var investButton: UIButton!
    
    @IBOutlet weak var deadlineSegControl: UISegmentedControl!
    
    @IBOutlet weak var interestRateLabel: UILabel!
    
    var superViewController:LowRiskInvestmentsVC
    
    var lowRiskInvestment:LowRiskInvestment
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.investmentNameLabel.text = self.lowRiskInvestment.name
        self.investmentDescriptionLabel.text = self.lowRiskInvestment.descript
        self.investmentValue.text = NSString(format:"$ %.2f",0) as String
        self.investmentSlider.value = 0.0
        self.investButton.enabled = false
        self.deadlineSegControl.selectedSegmentIndex = 0
        
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let deviceToken = delegate?.tabBarC
        deviceToken?.tabBarView.hidden = true
    }
    
    @IBAction func investmentSliderValueChanged(sender: AnyObject) {
        let value = AppData.sharedInstance.player.balance * Double(self.investmentSlider.value)
        if (value > 0){
            self.investButton.enabled = true
        } else {
            self.investButton.enabled = false
        }
        self.investmentValue.text = NSString(format:"$ %.2f",value) as String
    }
    
    init(pSuperViewController:LowRiskInvestmentsVC, pLowRiskInvestment:LowRiskInvestment) {
        self.superViewController = pSuperViewController
        self.lowRiskInvestment = pLowRiskInvestment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @IBAction func deadlineSegControlAct(sender: AnyObject) {
        if (deadlineSegControl.selectedSegmentIndex == 0){
            self.interestRateLabel.text = NSLocalizedString("intrt", comment: "") + ": 7% / day"
            self.lowRiskInvestment.interestRates = 0.07
        } else if (deadlineSegControl.selectedSegmentIndex == 1){
            self.interestRateLabel.text = NSLocalizedString("intrt", comment: "") + ": 8% / day"
            self.lowRiskInvestment.interestRates = 0.08
        } else if (deadlineSegControl.selectedSegmentIndex == 2){
            self.interestRateLabel.text = NSLocalizedString("intrt", comment: "") + ": 9% / day"
            self.lowRiskInvestment.interestRates = 0.09
        }
    }

    @IBAction func investButtonAct(sender: UIButton) {
        let value = AppData.sharedInstance.player.balance * Double(self.investmentSlider.value)
        var timeInterval:NSTimeInterval = 0
        
        if (deadlineSegControl.selectedSegmentIndex == 0){
            timeInterval = 43200
            self.lowRiskInvestment.interestRates = 0.07
        } else if (deadlineSegControl.selectedSegmentIndex == 1){
            timeInterval = 43200 * 2
            self.lowRiskInvestment.interestRates = 0.08
        } else if (deadlineSegControl.selectedSegmentIndex == 2){
            timeInterval = 43200 * 4
            self.lowRiskInvestment.interestRates = 0.09
        }
        
        
        AppData.sharedInstance.lowRiskInvestmentManager.applyInCDB(value, pInvestmentTerm: timeInterval, pInterestRate: self.lowRiskInvestment.interestRates)
        self.closePopView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func closeButtonAct(sender: UIButton) {
        self.closePopView()
    }

    
    
    func closePopView(){
        self.superViewController.blurView.hidden = true
        self.superViewController.popWindowView.hidden = true
        self.superViewController.viewDidLoad()
        self.superViewController.tableView.reloadData()
        self.view.removeFromSuperview()
    }
    
    

}
