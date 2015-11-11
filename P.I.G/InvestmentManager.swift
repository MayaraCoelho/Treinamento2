//
//  Manager.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class InvestmentManager{
    
    func applyInHighRiskInvestment(pEnterprise:Enterprise, pValue:Double){
        
        AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance - pValue
        
        //Checks if player does already have an investment in that Enterprise
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
            investment.currentValue = investment.currentValue + pValue
            investment.investedValue = investment.investedValue + pValue
            AppData.sharedInstance.player.highRiskInvestments.append(investment)
        } else {
            let investment = HighRiskInvestment(pEnterpriseID: pEnterprise.id, pInvestedValue: pValue)
            AppData.sharedInstance.player.highRiskInvestments.append(investment)
        }
    }
    
    
    func rescueFromHighRiskInvestment(pEnterprise:Enterprise){
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance + investment.currentValue
            AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
            
        }
    }
    
    
    func rescueFromHighRiskInvestment(pEnterprise:Enterprise, pValue:Double){
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            
            if (pValue <= investment.currentValue){
                AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
                investment.currentValue = investment.currentValue - pValue
                investment.investedValue = investment.currentValue
                AppData.sharedInstance.player.highRiskInvestments.append(investment)
                AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance + pValue
            } else if (pValue == investment.currentValue){
                self.rescueFromHighRiskInvestment(pEnterprise, pValue: pValue)
            }
            
        }
        
    }
    
    
    //  Saving Account
    func applyInSavingAccount(pValue:Double)
    {
        AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance - pValue
        let index = AppData.sharedInstance.player.lowRiskInvestmentIndexByID(1)
        AppData.sharedInstance.player.lowRiskInvestments[index].currentValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue + pValue
        AppData.sharedInstance.player.lowRiskInvestments[index].investedValue = AppData.sharedInstance.player.lowRiskInvestments[index].investedValue + pValue
    }
    
    func rescueFromSavingAccount(pValue:Double){
        let index = AppData.sharedInstance.player.lowRiskInvestmentIndexByID(1)
        if (pValue <= AppData.sharedInstance.player.lowRiskInvestments[index].currentValue){
            AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance + pValue
            AppData.sharedInstance.player.lowRiskInvestments[index].currentValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue - pValue
            AppData.sharedInstance.player.lowRiskInvestments[index].investedValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue
        }
    
    }
    
    
    
    
    //  CDB
    func applyInCDB(pValue:Double)
    {
        AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance - pValue
        let index = AppData.sharedInstance.player.lowRiskInvestmentIndexByID(2)
        AppData.sharedInstance.player.lowRiskInvestments[index].currentValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue + pValue
        AppData.sharedInstance.player.lowRiskInvestments[index].investedValue = AppData.sharedInstance.player.lowRiskInvestments[index].investedValue + pValue
    }
    
    
    func rescueFromCDB(pValue:Double){
        let index = AppData.sharedInstance.player.lowRiskInvestmentIndexByID(2)
        if (pValue <= AppData.sharedInstance.player.lowRiskInvestments[index].currentValue){
            AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance + pValue
            AppData.sharedInstance.player.lowRiskInvestments[index].currentValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue - pValue
            AppData.sharedInstance.player.lowRiskInvestments[index].investedValue = AppData.sharedInstance.player.lowRiskInvestments[index].currentValue
        }
        
    }
    
    
    
}