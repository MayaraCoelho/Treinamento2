//
//  Manager.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class HighRiskInvestmentManager{
    
    func applyInHighRiskInvestment(pEnterprise:Enterprise, pValue:Double){
        
        if (AppData.sharedInstance.player.canRemoveFromBalance(pValue)){
        AppData.sharedInstance.player.removeFromBalance(pValue)
            
            if (pEnterprise.stockValue == 0){
                let alert = UIAlertController(title: "Impossible to make investment", message: "Please, connect to internet before making High Risk Investments", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
                
                return
            }
            
            
        
        //Checks if player does already have an investment in that Enterprise
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
            investment.currentValue = investment.currentValue + pValue
            investment.startingValue = investment.startingValue + pValue
            AppData.sharedInstance.player.highRiskInvestments.append(investment)
        } else {
            let investment = HighRiskInvestment(pEnterpriseID: pEnterprise.id, pInvestedValue: pValue)
            AppData.sharedInstance.player.highRiskInvestments.append(investment)
        }
            
      }
    }
    
    
    func rescueFromHighRiskInvestment(pEnterprise:Enterprise){
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            AppData.sharedInstance.player.addToBalance(investment.currentValue)
            AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
        }
    }
    
    
    func rescueFromHighRiskInvestment(pEnterprise:Enterprise, pValue:Double){
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            if (pValue <= investment.currentValue){
                AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
                investment.currentValue = investment.currentValue - pValue
                investment.startingValue = investment.startingValue
                AppData.sharedInstance.player.highRiskInvestments.append(investment)
                AppData.sharedInstance.player.addToBalance(pValue)
            } else if (pValue == investment.currentValue){
                self.rescueFromHighRiskInvestment(pEnterprise, pValue: pValue)
            }
            
        }
        
    }
    

    
}