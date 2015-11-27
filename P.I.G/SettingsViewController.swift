//
//  SettingsViewController.swift
//  PIG
//
//  Created by Henrique do Prado Linhares on 27/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var musicSwitch: UISwitch!
    
    var musicStatus = PListManager.sharedInstance.readPlist("Database", key: "music") as! Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicSwitch.on = self.musicStatus
        
        // Do any additional setup after loading the view.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func musicSwitchChangedValue(sender: AnyObject) {
        if (self.musicStatus == true){
            self.musicStatus = false
            AudioControler.sharedInstance.stopBackgroundSong()
        } else {
            self.musicStatus = true
            AudioControler.sharedInstance.playBackgroundSong()
        }
        PListManager.sharedInstance.writePlist("Database", key: "music", data: self.musicStatus)
    }

    @IBAction func closeButtonAct(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func restartGameButtonAct(sender: UIButton) {
        
        // Create the alert controller
        let alertController = UIAlertController(title: "Restart Game", message: "Are you shure ?", preferredStyle: .Alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "YES", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            AppData.sharedInstance.startNewGame()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func developersButtonAct(sender: UIButton) {
        self.presentViewController(DevelopersInfoViewController(), animated: true, completion: nil)
    }
    
    
}
