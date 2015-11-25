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

    
    
    func applyInCDB(pValue:Double, pInvestmentTerm:NSTimeInterval, pInterestRate:Float){
        if (AppData.sharedInstance.player.canRemoveFromBalance(pValue)){
            AppData.sharedInstance.player.removeFromBalance(pValue)
            let index = AppData.sharedInstance.player.lowRiskInvestmentIndexByID(2)
            print("INDEX: \(index)")
            AppData.sharedInstance.player.lowRiskInvestments[index].currentValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue + pValue
            AppData.sharedInstance.player.lowRiskInvestments[index].startingValue = AppData.sharedInstance.player.lowRiskInvestments[index].startingValue + pValue
            AppData.sharedInstance.player.lowRiskInvestments[index].startDate = NSDate()
            AppData.sharedInstance.player.lowRiskInvestments[index].investmentTerm = pInvestmentTerm
            AppData.sharedInstance.player.lowRiskInvestments[index].interestRates = pInterestRate
        }
    }
    
    func rescueFromCDB(){
        let index = AppData.sharedInstance.player.lowRiskInvestmentIndexByID(2)
        let now = NSDate()
        let currentInterval =  now.timeIntervalSinceDate(AppData.sharedInstance.player.lowRiskInvestments[index].startDate)
        if (currentInterval >= AppData.sharedInstance.player.lowRiskInvestments[index].investmentTerm){
            AppData.sharedInstance.player.addToBalance(AppData.sharedInstance.player.lowRiskInvestments[index].currentValue)
            AppData.sharedInstance.player.lowRiskInvestments[index].currentValue = 0
            AppData.sharedInstance.player.lowRiskInvestments[index].startingValue = 0
        }
        
        
    }
    




}