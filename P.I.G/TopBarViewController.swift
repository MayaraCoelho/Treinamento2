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
    var updateTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.walletLabel.text = NSString(format: "Wallet: $ %.2f", AppData.sharedInstance.player.balance) as String
        self.incomeLabel.text = NSString(format: "Income: $ %.2f / day", AppData.sharedInstance.player.income) as String
        self.updateTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateViewValues", userInfo: nil, repeats: true)
    }

    func updateViewValues(){
        self.walletLabel.text = NSString(format: "Wallet: $ %.2f", AppData.sharedInstance.player.balance) as String
        self.incomeLabel.text = NSString(format: "Income: $ %.2f / day", AppData.sharedInstance.player.income) as String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.updateTimer.invalidate()
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
