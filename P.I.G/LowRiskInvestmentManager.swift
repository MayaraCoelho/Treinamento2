//
//  LowRiskInvestmentManager.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 24/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class LowRiskInvestmentManager{




    func applyInSavingAccount(pValue:Double){
        if (AppData.sharedInstance.player.canRemoveFromBalance(pValue)){
            AppData.sharedInstance.player.removeFromBalance(pValue)
            let index = AppData.sharedInstance.player.lowRiskInvestmentIndexByID(1)
            AppData.sharedInstance.player.lowRiskInvestments[index].currentValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue + pValue
            AppData.sharedInstance.player.lowRiskInvestments[index].startingValue = AppData.sharedInstance.player.lowRiskInvestments[index].startingValue + pValue
        }
    }
    
    
    func rescueFromSavingAccount(pValue:Double){
        let index = AppData.sharedInstance.player.lowRiskInvestmentIndexByID(1)
        if (pValue <= AppData.sharedInstance.player.lowRiskInvestments[index].currentValue){
            AppData.sharedInstance.player.addToBalance(pValue)
            AppData.sharedInstance.player.lowRiskInvestments[index].currentValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue - pValue
            AppData.sharedInstance.player.lowRiskInvestments[index].startingValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue
        }
    }





}