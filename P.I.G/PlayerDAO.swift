//
//  PlayerDAO.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 21/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class PlayerDAO{

    static let sharedInstance = PlayerDAO()
    
    func savePlayer(){
        print("saving player")
        let playerData : NSData = NSKeyedArchiver.archivedDataWithRootObject(AppData.sharedInstance.player)
        PListManager.sharedInstance.writePlist("Database", key: "player", data: playerData)
    }
    
        
    func readPlayer(){
        print("reading player")
        let read = PListManager.sharedInstance.readPlist("Database", key: "player")
        let data = read as! NSData
        AppData.sharedInstance.player = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Player
    }

}