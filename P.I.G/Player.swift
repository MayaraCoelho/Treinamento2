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
    self.lowRiskInvestments = LRIProperties.init().arrayLRI
    self.income = 400
    self.properties = [Property]()
    self.goals = [Goal]()
    }

    func doesHaveHighRiskInvestmentInEnterprise(pEnterprise:Enterprise)->Bool{

        for hri:HighRiskInvestment in self.highRiskInvestments{
            if (hri.enterpriseID == pEnterprise.id){
                return true
            }
        }
        return false
    }
    
    
    func highRiskInvestmentForEnterprise(pEnterprise:Enterprise)->HighRiskInvestment?{
        for hri:HighRiskInvestment in self.highRiskInvestments{
            if (hri.enterpriseID == pEnterprise.id){
                return hri
            }
        }
        return nil
    }
    
    
    func removeHighRiskInvestmentForEnterprise(pEnterprise:Enterprise){
        var index = 0
        for hri:HighRiskInvestment in self.highRiskInvestments{
            if (hri.enterpriseID == pEnterprise.id){
                self.highRiskInvestments.removeAtIndex(index)
            }
            index++
        }
    }
    
    
    func lowRiskInvestmentIndexByID(pID:Int)->Int{
        var count = 0;
        for lri:LowRiskInvestment in self.lowRiskInvestments{
            if (lri.id == pID){
            return count
            }
            count++
        }
        return -1
    }
    
    func incomePerSecond()->Double{
        let incomePerHour = self.income / 24
        let incomePerMinute = incomePerHour / 60
        let incomePerSecond = incomePerMinute / 60
        return incomePerSecond
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