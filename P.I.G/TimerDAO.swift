//
//  TimerDAO.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 11/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class TimerDAO{
    
    static let sharedInstance = TimerDAO()
    
    func saveTimer(){
        print("saving Timer")
        let timerData : NSData = NSKeyedArchiver.archivedDataWithRootObject(AppData.sharedInstance.timer)
        PListManager.sharedInstance.writePlist("Database", key: "Timer", data: timerData)
    }
    
    
    func readTimer(){
        print("reading Timer")
        let read = PListManager.sharedInstance.readPlist("Database", key: "Timer")
        let data = read as! NSData
        AppData.sharedInstance.timer = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Timer
    }


}