//
//  PropertiesDetailsVC.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 16/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class PropertiesDetailsVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var propertyValueLabel: UILabel!
    @IBOutlet weak var returningValueLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var ownedLabel: UILabel!
    @IBOutlet weak var buyStepper: UIStepper!
    @IBOutlet weak var sellStepper: UIStepper!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    
    var currentValueBuy: Int = 0
    var currentValueSell: Int = 0
    let superViewController:PropertiesVC
    let property:Property
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.propertyNameLabel.text = self.property.name
        self.propertyValueLabel.text = NSLocalizedString("prpv", comment: "") + ": $\(self.property.value.description)"
        self.returningValueLabel.text = NSLocalizedString("retv", comment: "") + ": $\(self.property.returningValue.description)" + "/" + NSLocalizedString("day", comment: "")
        self.ownedLabel.text = NSLocalizedString("own", comment: "") + PropertiesManager().doesPlayerHaveProperty(self.property).description
        
//        if (PropertiesManager().doesPlayerHaveProperty(self.property) > 0){
//            self.sellButton.enabled = true
//        } else {
//            self.sellButton.enabled = false
//        }

//        if (AppData.sharedInstance.player.balance >= self.property.value){
//            self.buyButton.enabled = true
//        } else {
//            self.buyButton.enabled = false
//        }
        
        buyStepper.minimumValue = 0
        sellStepper.maximumValue = Double (PropertiesManager().doesPlayerHaveProperty(self.property))
        
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let deviceToken = delegate?.tabBarC
        deviceToken?.tabBarView.hidden = true
//        self.tabBarController?.removeFromParentViewController()
        
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
    
    
    @IBAction func buyStepperAct(sender: AnyObject) {
        
        if (AppData.sharedInstance.player.balance >= ((self.property.value)*buyStepper.value)){
            buyLabel.text = NSLocalizedString("buy", comment: "")+": \(buyStepper.value)"
            currentValueBuy = Int(buyStepper.value)
            print("comprar \(currentValueBuy)")
        }
        
    }

    @IBAction func sellStepperAct(sender: AnyObject) {
        
        if (PropertiesManager().doesPlayerHaveProperty(self.property)>0){
            print("entrei")
            sellLabel.text = NSLocalizedString("sell", comment: "")+": \(sellStepper.value)"
            currentValueSell = Int(sellStepper.value)
            print("vender \(currentValueSell)")
        }
    }

    @IBAction func buyButtonAct(sender: UIButton) {
        var i: Int
        for (i = 0; i < currentValueBuy; i++){
            PropertiesManager().buyProperty(self.property)
        }
        self.closeButtonAct(self.closeButton)
    }
    
    @IBAction func sellButtonAct(sender: UIButton) {
        var i: Int
        for (i = 0; i < currentValueSell; i++){
            PropertiesManager().sellProperty(self.property)
        }
        self.closeButtonAct(self.closeButton)
    }
    
    
    @IBAction func closeButtonAct(sender: UIButton) {
        self.superViewController.blurView.hidden = true
        self.superViewController.containerView.hidden = true
        self.superViewController.tableView.reloadData()
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let deviceToken = delegate?.tabBarC
        deviceToken?.tabBarView.hidden = false
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
