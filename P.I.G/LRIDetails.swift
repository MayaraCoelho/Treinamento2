//
//  InvestmentVC.swift
//  P.I.G
//
//  Created by Mayara Coelho on 11/9/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class LRIDetails: UIViewController {

    
    @IBOutlet weak var lowRisckName: UILabel!
    
    @IBOutlet weak var amountInvestedValue: UILabel!
    
    @IBOutlet weak var investmentValue: UILabel!
    
    @IBOutlet weak var investmentSlider: UISlider!
    
    @IBOutlet weak var rescueValue: UILabel!
    
    @IBOutlet weak var rescueSlider: UISlider!
    
    var superViewController:LowRiskInvestmentsVC
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init(pSuperViewController:LowRiskInvestmentsVC) {
        self.superViewController = pSuperViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func exitButtonAct(sender: UIButton) {
        self.superViewController.blurView.hidden = true
        self.superViewController.popWindowView.hidden = true
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
