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
    

    var homeViewController:HighRiskInvestmentsVC
    var investment:HighRiskInvestment
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.enterpriseNameLabel.text = self.investment.enterprise.name
        self.enterpriseDescriptionLabel.text = self.investment.enterprise.descript
        self.enterpriseValueLabel.text = self.investment.enterprise.value.description
        self.investedValueLabel.text = NSString(format: "Investment Value: %.2f",self.investment.currentValue) as String
        
        // Do any additional setup after loading the view.
    }
    
    init(pInvestment:HighRiskInvestment,  pHomeViewController:HighRiskInvestmentsVC) {
        self.investment = pInvestment
        self.homeViewController = pHomeViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func closeViewButtonAct(sender: UIButton) {
        self.closePopUpScreen()
    }

    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
