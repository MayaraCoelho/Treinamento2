//
//  CDBMade.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 24/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class CDBMade: UIViewController {
    
    
    @IBOutlet weak var investmentName: UILabel!
    
    @IBOutlet weak var investmentStatus: UILabel!
    
    @IBOutlet weak var rescueButton: UIButton!
    
    @IBOutlet weak var timeUntilRescue: UILabel!
    
    @IBOutlet weak var startingValue: UILabel!
    
    @IBOutlet weak var currentValue: UILabel!
    
    @IBOutlet weak var aboutTimeLbl: UILabel!
    
    var updateTimer = NSTimer()
    
    
    var superViewController:LowRiskInvestmentsVC
    
    var lowRiskInvestment:LowRiskInvestment
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutTimeLbl.text = NSLocalizedString("time", comment: "")
        
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let deviceToken = delegate?.tabBarC
        deviceToken?.tabBarView.hidden = true
        self.investmentName.text = self.lowRiskInvestment.name
        self.updateView()
    }

    
    override func viewWillAppear(animated: Bool) {
        self.updateTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateView", userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.updateTimer.invalidate()
    }
    
    
    func updateView(){
        let now = NSDate()
        let currentInterval =  now.timeIntervalSinceDate(self.lowRiskInvestment.startDate)
        
        if (currentInterval >= self.lowRiskInvestment.investmentTerm){
            self.investmentStatus.text = NSLocalizedString("stsReady", comment: "")
            self.investmentStatus.backgroundColor = AppUIColors().myGreenColor
            self.rescueButton.enabled = true
                    self.timeUntilRescue.text = self.stringFromTimeInterval(0)
        } else {
            self.investmentStatus.text = NSLocalizedString("stsNotReady", comment: "")
            self.investmentStatus.backgroundColor = AppUIColors().myRedColor
            self.rescueButton.enabled = false
            let investmentEndDate = self.lowRiskInvestment.startDate.dateByAddingTimeInterval(self.lowRiskInvestment.investmentTerm)
            self.timeUntilRescue.text = self.stringFromTimeInterval(investmentEndDate.timeIntervalSinceDate(now))
        }
        
        var investmentEndDate = self.lowRiskInvestment.startDate.dateByAddingTimeInterval(self.lowRiskInvestment.investmentTerm)
        
       // self.timeUntilRescue.text = self.stringFromTimeInterval(investmentEndDate.timeIntervalSinceDate(now))
    
        self.startingValue.text =  NSString(format: NSLocalizedString("initv", comment: "") + ": %.2f ",AppData.sharedInstance.player.lowRiskInvestments[AppData.sharedInstance.player.lowRiskInvestmentIndexByID(2)].startingValue) as String
            
         self.currentValue.text =  NSString(format: NSLocalizedString("curv", comment: "") + ": %.2f ",AppData.sharedInstance.player.lowRiskInvestments[AppData.sharedInstance.player.lowRiskInvestmentIndexByID(2)].currentValue) as String
    }
    
    
    
    @IBAction func closeButtonAct(sender: UIButton) {
        self.closePopView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    init(pSuperViewController:LowRiskInvestmentsVC, pLowRiskInvestment:LowRiskInvestment) {
        self.superViewController = pSuperViewController
        self.lowRiskInvestment = pLowRiskInvestment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func closePopView(){
        self.superViewController.blurView.hidden = true
        self.superViewController.popWindowView.hidden = true
        self.superViewController.viewDidLoad()
        self.superViewController.tableView.reloadData()
        self.view.removeFromSuperview()
    }
    
    func stringFromTimeInterval(interval: NSTimeInterval) -> String {
        let interval = Int(interval)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    @IBAction func rescueButtonAct(sender: UIButton) {
        AppData.sharedInstance.lowRiskInvestmentManager.rescueFromCDB()
        self.closePopView()
    }
    
    
}
