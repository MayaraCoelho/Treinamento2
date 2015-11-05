//
//  AppData.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class AppData{
    static let sharedInstance = AppData()
    
    var player:Player
    var store:Store
    var enterprises:[Enterprise]
    var timer:Timer
    var investmentManager:InvestmentManager
    var properties: [Property]
    
    
    
    init(){
        self.player = Player()
        self.store = Store()
        self.enterprises = EnterpriseProperties.init().enterprises
        self.timer = Timer()
        self.investmentManager = InvestmentManager()
        self.properties = PropertyProperties.init().properties
    }
    
    
    func startNewGame(){
        self.player = Player()
        self.store = Store()
        self.enterprises = EnterpriseProperties.init().enterprises
        self.timer = Timer()
    }

    
    func enterpriseByID(pID:Int)->Enterprise?{
        for e:Enterprise in self.enterprises{
            if (e.id == pID){
            return e
            }
        }
        return nil
    }
    
    
}