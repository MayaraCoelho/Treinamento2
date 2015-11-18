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
    
    var currentValue: Int
    let superViewController:PropertiesVC
    let property:Property
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.propertyNameLabel.text = self.property.name
        self.propertyValueLabel.text = "Property Value: " + self.property.value.description
        self.returningValueLabel.text = "Returning Value: " + self.property.returningValue.description + " /day"
        self.ownedLabel.text = "Owned: " + PropertiesManager().doesPlayerHaveProperty(self.property).description
        if (PropertiesManager().doesPlayerHaveProperty(self.property) > 0){
            self.sellButton.enabled = true
        } else {
            self.sellButton.enabled = false
        }
        
        if (AppData.sharedInstance.player.balance >= self.property.value){
            self.buyButton.enabled = true
        } else {
            self.buyButton.enabled = false
        }
        buyStepper.minimumValue = 0
        buyStepper.value = Double(PropertiesManager().doesPlayerHaveProperty(self.property))

        // Do any additional setup after loading the view.
    }
    
    init(pSuperViewController:PropertiesVC, pProperty:Property) {
        self.superViewController = pSuperViewController
        self.property = pProperty
        self.currentValue = PropertiesManager().doesPlayerHaveProperty(self.property)
        print(currentValue)
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
        
        if(Double(currentValue) < buyStepper.value){
            if (AppData.sharedInstance.player.balance >= self.property.value){
                PropertiesManager().buyProperty(self.property)
                currentValue++
                print("aumentou \(currentValue)")
            }
            else{
                buyStepper.value = Double(currentValue)
                print("mantem \(currentValue)")
            }
            
        }
        else{
            PropertiesManager().sellProperty(self.property)
            currentValue--
            print("diminuiu \(currentValue)")
        }
        ownedLabel.text = "Owned: " + PropertiesManager().doesPlayerHaveProperty(self.property).description

        
    }

    @IBAction func buyButtonAct(sender: UIButton) {
        PropertiesManager().buyProperty(self.property)
        self.closeButtonAct(self.closeButton)
    }
    
    @IBAction func sellButtonAct(sender: UIButton) {
        PropertiesManager().sellProperty(self.property)
        self.closeButtonAct(self.closeButton)
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
