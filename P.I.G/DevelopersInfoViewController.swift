//
//  DevelopersInfoViewController.swift
//  PIG
//
//  Created by Henrique do Prado Linhares on 27/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class DevelopersInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonAct(sender: UIButton) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }


}
