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
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    
    var currentNumberOfBuys: Int = 0
    var currentNumberOfSells: Int = 0
    
    
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
    
    
    
    @IBAction func buyPlusButtonAct(sender: UIButton) {
        if (AppData.sharedInstance.player.balance >= ((self.property.value)*Double(self.currentNumberOfBuys + 1))){
            self.currentNumberOfBuys = self.currentNumberOfBuys + 1
            buyLabel.text = NSLocalizedString("buy", comment: "")+": \(self.currentNumberOfBuys)"
        }
    }
    
    
    @IBAction func buyMinusButtonAct(sender: UIButton) {
        if (self.currentNumberOfBuys > 0){
            self.currentNumberOfBuys = self.currentNumberOfBuys - 1
            buyLabel.text = NSLocalizedString("buy", comment: "")+": \(self.currentNumberOfBuys)"
        }
    }
    
    
    @IBAction func sellPlusButtonAct(sender: UIButton) {
        let numberOfProperties = PropertiesManager().doesPlayerHaveProperty(self.property)
        if (numberOfProperties >= self.currentNumberOfSells + 1){
            self.currentNumberOfSells = self.currentNumberOfSells + 1
            sellLabel.text = NSLocalizedString("sell", comment: "")+": \(self.currentNumberOfSells)"
        }
    }
    
    
    @IBAction func sellMinusButtonAct(sender: UIButton) {
        if (self.currentNumberOfSells > 0){
            self.currentNumberOfSells = self.currentNumberOfSells - 1
            sellLabel.text = NSLocalizedString("sell", comment: "")+": \(self.currentNumberOfSells)"
        }
        
    }



    @IBAction func buyButtonAct(sender: UIButton) {
        var i: Int
        for (i = 0; i < currentNumberOfBuys; i++){
            PropertiesManager().buyProperty(self.property)
        }
        self.closeButtonAct(self.closeButton)
    }
    
    @IBAction func sellButtonAct(sender: UIButton) {
        var i: Int
        for (i = 0; i < currentNumberOfSells; i++){
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



}
