//
//  Player.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Player:NSObject, NSCoding{
    
    var balance:Double
    var highRiskInvestments:[HighRiskInvestment]
    var lowRiskInvestments:[LowRiskInvestment]
    var income:Double
    var properties:[Property]
    var goals:[Goal]
    
    override init(){
    self.balance = 1000
    self.highRiskInvestments = [HighRiskInvestment]()
    self.lowRiskInvestments = [LowRiskInvestment]()
    self.income = 400
    self.properties = [Property]()
    self.goals = [Goal]()
    }

    func doesHaveHighRiskInvestmentInEnterprise(pEnterprise:Enterprise)->Bool{

        for hri:HighRiskInvestment in self.highRiskInvestments{
            if (hri.enterprise.id == pEnterprise.id){
                return true
            }
        }
        return false
    }
    
    
    func highRiskInvestmentForEnterprise(pEnterprise:Enterprise)->Investment?{
        for hri:HighRiskInvestment in self.highRiskInvestments{
            if (hri.enterprise.id == pEnterprise.id){
                return hri
            }
        }
        return nil
    }
    
    
    func removeHighRiskInvestmentForEnterprise(pEnterprise:Enterprise){
        var index = 0
        for hri:HighRiskInvestment in self.highRiskInvestments{
            if (hri.enterprise.id == pEnterprise.id){
                let investment = self.highRiskInvestments.removeAtIndex(index)
                print("removing \(investment.enterprise.name) from investments")
            }
            index++
        }
    }
    
    
    
    
    
    
    //NSCoding Methods 
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        
        
        guard let dBalance = decoder.decodeObjectForKey("balance") as? Double
            else {return nil }
        self.balance = dBalance
    
       
        guard let dHighRiskInvestments = decoder.decodeObjectForKey("HighRiskInvestments") as? [HighRiskInvestment]
            else {return nil }
        self.highRiskInvestments = dHighRiskInvestments
        
        
        guard let dLowRiskInvestments = decoder.decodeObjectForKey("LowRiskInvestments") as? [LowRiskInvestment]
            else {return nil }
        self.lowRiskInvestments = dLowRiskInvestments
        
        
        guard let dIncome = decoder.decodeObjectForKey("income") as? Double
            else {return nil }
        self.income = dIncome
        

        
        
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.balance, forKey: "balance")
        coder.encodeObject(self.highRiskInvestments, forKey: "HighRiskInvestments")
        coder.encodeObject(self.lowRiskInvestments, forKey: "LowRiskInvestments")
        coder.encodeObject(self.income, forKey: "income")
    }
    
}