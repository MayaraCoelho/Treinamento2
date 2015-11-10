//
//  DeveloperInfoVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 10/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class DeveloperInfoVC: UIViewController {

    @IBOutlet weak var enterprisesLastUpdate: UILabel!
    
    @IBOutlet weak var enterprisesTimeUntilNextUpdate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateScreen", userInfo: "nil", repeats: true)
        // Do any additional setup after loading the view.
    }
    
    
    func updateScreen(){
        print("updating devinfo screen")
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        self.enterprisesLastUpdate.text = "Last Update : " + (AppData.sharedInstance.timer.lastEnterpriseUpdate?.descriptionWithLocale(NSLocale.currentLocale().localeIdentifier))!
        
        self.enterprisesTimeUntilNextUpdate.text = "Interval since last update : " + (AppData.sharedInstance.timer.lastEnterpriseUpdate?.timeIntervalSinceNow.description)!
    
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
