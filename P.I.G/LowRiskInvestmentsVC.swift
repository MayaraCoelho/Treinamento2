//
//  LowRiskInvestmentsVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class LowRiskInvestmentsVC: UIViewController {

    @IBOutlet weak var topBarContainverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topBarVC = TopBarViewController()
        self.addChildViewController(topBarVC)
        self.topBarContainverView.addSubview(topBarVC.view)
        // Do any additional setup after loading the view.
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
