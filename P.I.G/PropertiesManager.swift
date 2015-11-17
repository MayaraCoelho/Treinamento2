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
        
        if (AppData.sharedInstance.player.canRemoveFromBalance(pProperty.value)){
            AppData.sharedInstance.player.removeFromBalance(pProperty.value)
            AppData.sharedInstance.player.properties.append(pProperty)
            self.calculatePlayerIncome()
        }
    }
    
    
    
    func sellProperty(pProperty:Property){
        if (doesPlayerHaveProperty(pProperty) > 0){
            AppData.sharedInstance.player.income = AppData.sharedInstance.player.income - Double(pProperty.returningValue)
            removeSingleProperty(pProperty.id)
            AppData.sharedInstance.player.addToBalance(pProperty.value)
        }
    }
    
    
    func removeSingleProperty(pPropertyID:Int){
        var index = 0
        for prop in AppData.sharedInstance.properties{
            if (prop.id == pPropertyID){
                AppData.sharedInstance.properties.removeAtIndex(index)
                return
            }
            index = index + 1
        }
    }
    

    func doesPlayerHaveProperty(pProperty:Property)->Int{
        var count = 0
        let playerProperties = AppData.sharedInstance.player.properties
        for prop:Property in playerProperties{
            if (prop.id == pProperty.id){
                count = count + 1
            }
        }
        return count
    }
    

    
    
    func calculatePlayerIncome(){
        let playerProperties = AppData.sharedInstance.player.properties
        var income:Double = 400
        for prop:Property in playerProperties{
            income = income + Double(prop.returningValue)
        }
        AppData.sharedInstance.player.income = income
    }
    
    
}