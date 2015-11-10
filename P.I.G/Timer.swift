//
//  Timer.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Timer:NSObject {
    
    var lastIterationDate:NSDate?
    
    
    var lastEnterpriseUpdate:NSDate?
    
    
    var timer = NSTimer()
    
    
    func startUpdates(){
        self.updateEnterprises()
        NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "updateEnterprises", userInfo: "nil", repeats: true)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateLocalInterests", userInfo: "nil", repeats: true)
    }
    
    
    func updateEnterprises(){
        EnterpriseValueUpdater().updateAllEnterprises()
        self.lastEnterpriseUpdate = NSDate()
        print("passou aqui @#@#@#")
    }
    
    
    func updateLocalInterests(){
        
        
        self.lastIterationDate = NSDate()
    }
    
    
}