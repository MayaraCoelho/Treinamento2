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
    var enterprises:Enterprises
    var timer:Timer
    var investmentManager:InvestmentManager
    
    
    
    init(){
        self.player = Player()
        self.store = Store()
        self.enterprises = Enterprises()
        self.timer = Timer()
        self.investmentManager = InvestmentManager()
    }
    
    
    func startNewGame(){
        self.player = Player()
        self.store = Store()
        self.enterprises = Enterprises()
        self.timer = Timer()
    }

}