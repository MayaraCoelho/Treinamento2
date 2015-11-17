//
//  PropertiesManager.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 17/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class PropertiesManager{

    func buyProperty(pProperty:Property){
        if (!doesPlayerHaveProperty(pProperty)){
            if (AppData.sharedInstance.player.canRemoveFromBalance(pProperty.value)){
                AppData.sharedInstance.player.removeFromBalance(pProperty.value)
                AppData.sharedInstance.player.properties.append(pProperty)
                self.calculatePlayerIncome()
            }
        }
    
    }
    
    
    
    func sellProperty(pProperty:Property){
    
    }
    
    

    func doesPlayerHaveProperty(pProperty:Property)->Bool{
        let playerProperties = AppData.sharedInstance.player.properties
        for prop:Property in playerProperties{
            if (prop.id == pProperty.id){
                return true
            }
        }
        return false
    }
    

    
    func calculatePlayerIncome(){
        let playerProperties = AppData.sharedInstance.player.properties
        var income:Double = 400
        for prop:Property in playerProperties{
            income = income + Double(prop.returningMiniumValue)
        }
        AppData.sharedInstance.player.income = income
    }
    
    
}