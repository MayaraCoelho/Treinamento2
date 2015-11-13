//
//  Timer.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Timer:NSObject, NSCoding {
    
    var lastLocalUpdate:NSDate?
    
    var lastEnterpriseUpdate:NSDate?
    
    var timer = NSTimer()
    
    
    func startUpdates(){
        self.updateEnterprises()
        NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "updateEnterprises", userInfo: "nil", repeats: true)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "localUpdate", userInfo: "nil", repeats: true)
    }
    
    
    func updateEnterprises(){
        EnterpriseValueUpdater().updateAllEnterprises()
        self.lastEnterpriseUpdate = NSDate()
    }
    
    
    func localUpdate(){
        let now = NSDate()
        
      
        
        
        if (self.lastLocalUpdate != nil){
            var timeInterval = now.timeIntervalSinceDate(self.lastLocalUpdate!)
            
            
            if (timeInterval < 1){
                timeInterval = 1
            } else if (timeInterval < 1.5){
                timeInterval = 1
            }
            
            
            
           // print(">>>>>> Time interval:" + timeInterval.description)
            AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance + (AppData.sharedInstance.player.incomePerSecond() * timeInterval)
            
            
            AppData.sharedInstance.player.lowRiskInvestments[0].currentValue = AppData.sharedInstance.player.lowRiskInvestments[0].currentValue * Double(AppData.sharedInstance.player.lowRiskInvestments[0].interestRatePerSecond())
            AppData.sharedInstance.player.lowRiskInvestments[1].currentValue = AppData.sharedInstance.player.lowRiskInvestments[1].currentValue * Double(AppData.sharedInstance.player.lowRiskInvestments[1].interestRatePerSecond())
            
            /*
            
            Deixei este loop comentando por questão de performance
            
            for(var count=0; count < AppData.sharedInstance.player.lowRiskInvestments.count; count++){
            
                let integerTimeInterval:Int = Int(timeInterval)
                print("Time interval integer value: \(integerTimeInterval)")
                var k:Int
                
                for k=integerTimeInterval; k > 0; k-- {
                print("@#$@#@$@#@$@#@$#@ PASSANDO PELO FOR $@#@$@#@$@#$@#@$@$%@$%$@@#@$#@")
                AppData.sharedInstance.player.lowRiskInvestments[count].currentValue = AppData.sharedInstance.player.lowRiskInvestments[count].currentValue * Double(AppData.sharedInstance.player.lowRiskInvestments[count].interestRatePerSecond())
                }
                
                
                print("\(AppData.sharedInstance.player.lowRiskInvestments[count].name) -=- \(AppData.sharedInstance.player.lowRiskInvestments[count].currentValue)")
            }*/
            
            
          
        }
        
        
        self.lastLocalUpdate = now
        
        // APAGAR ESTA LINHA ---- FIX ME
        TimerDAO.sharedInstance.saveTimer()
    }
    
    
    
    
    //NSCoding Methods
    required convenience init?(coder decoder: NSCoder) {
        
        guard let dLastLocalUpdate = decoder.decodeObjectForKey("lastLocalUpdate") as? NSDate
            else {return nil }
        
        guard let dLastEnterpriseUpdate = decoder.decodeObjectForKey("lastEnterpriseUpdate") as? NSDate
            else {return nil }
        
        self.init()
        self.lastLocalUpdate = dLastLocalUpdate
        self.lastEnterpriseUpdate = dLastEnterpriseUpdate
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.lastLocalUpdate, forKey: "lastLocalUpdate")
        coder.encodeObject(self.lastEnterpriseUpdate, forKey: "lastEnterpriseUpdate")
    }
    
    
    
    
    
    
}