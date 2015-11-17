//
//  PropertiesDetailsVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 16/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class PropertiesDetailsVC: UIViewController {

    @IBOutlet weak var propertyNameLabel: UILabel!
    
    @IBOutlet weak var propertyValueLabel: UILabel!
    
    @IBOutlet weak var returningValueLabel: UILabel!
    
    
    let superViewController:PropertiesVC
    let property:Property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.propertyNameLabel.text = self.property.name
        self.propertyValueLabel.text = "Property Value: " + self.property.value.description
        self.returningValueLabel.text = "Returning Value: " + self.property.returningMiniumValue.description + " /day"
        // Do any additional setup after loading the view.
    }
    
    init(pSuperViewController:PropertiesVC, pProperty:Property) {
        self.superViewController = pSuperViewController
        self.property = pProperty
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func buyButtonAct(sender: UIButton) {
        PropertiesManager().buyProperty(self.property)
    }
    
    @IBAction func closeButtonAct(sender: UIButton) {
        self.superViewController.blurView.hidden = true
        self.superViewController.containerView.hidden = true
        self.superViewController.tableView.reloadData()
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
