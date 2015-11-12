//
//  GoalsVC.swift
//  P.I.G
//
//  Created by Mayara Coelho on 11/12/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {

    @IBOutlet weak var topBarView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topBar = TopBarViewController()
        addChildViewController(topBar)
        self.topBarView.addSubview(topBar.view)
        
        
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