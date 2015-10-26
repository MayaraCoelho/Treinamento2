//
//  Timer.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Timer:NSObject {
    var startGameTime:NSDate
    var lastUserActivity:NSDate
    var currentDate:NSDate
    
    var timer = NSTimer()
    
    
    override init(){
        self.startGameTime = NSDate()
        self.lastUserActivity = NSDate()
        self.currentDate = NSDate()
        
 
    }
    
    func startUpdates(){
        NSTimer.scheduledTimerWithTimeInterval(8, target: self, selector: "updateEnterprises", userInfo: "nil", repeats: true)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateHRInvestments", userInfo: "nil", repeats: true)
    }
    
    func updateEnterprises(){
    EnterpriseValueUpdater().updateAllEnterprises()
    
    }
    
    
    
    
    
    func updateHRInvestments(){
        
        
        
        for hri:HighRiskInvestment in AppData.sharedInstance.player.highRiskInvestments {
            print("updating HRI")
            hri.update()
        }
    }
    
    
    
    
    
    
}