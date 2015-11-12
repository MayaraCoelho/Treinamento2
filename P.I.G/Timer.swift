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
            let timeInterval = now.timeIntervalSinceDate(self.lastLocalUpdate!)
            print(">>>>>> Time interval:" + timeInterval.description)
            AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance + (AppData.sharedInstance.player.incomePerSecond() * timeInterval)
        
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