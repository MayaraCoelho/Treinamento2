
//
//  TopBarViewController.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class TopBarViewController: UIViewController {

    @IBOutlet weak var walletLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var goalsButton: UIButton!
    
    let goalsView = GoalsVC(nibName:"GoalsVC", bundle:nil)
    
    var updateTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateView()
        self.updateTimer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "updateView", userInfo: nil, repeats: true)
    }

    func updateView(){
        self.walletLabel.text = NSString(format: "Wallet: $ %.2f", AppData.sharedInstance.player.balance) as String
        self.incomeLabel.text = NSString(format: "Income: $ %.2f / day", AppData.sharedInstance.player.income) as String
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    override func viewWillDisappear(animated: Bool) {
        self.updateTimer.invalidate()
    }*/

}
