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
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise) as! HighRiskInvestment
            AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
            investment.currentValue = investment.currentValue + pValue
            investment.investedValue = investment.investedValue + pValue
            AppData.sharedInstance.player.highRiskInvestments.append(investment)
        } else {
            let investment = HighRiskInvestment(pEnterprise: pEnterprise, pInvestedValue: pValue)
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
            
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise) as! HighRiskInvestment
            
            if (investment.currentValue <= pValue){
                AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
                investment.currentValue = investment.currentValue - pValue
                investment.investedValue = investment.currentValue
                AppData.sharedInstance.player.highRiskInvestments.append(investment)
                AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance + pValue
            }
            
        }
    
    }
    
    
    
}