//
//  Player.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Player:NSObject{
    var balance:Double
    var highRiskInvestments:[HighRiskInvestment]
    var lowRiskInvestments:[LowRiskInvestment]
    var income:Float
    var manager:Manager
    var properties:[Property]
    var goals:[Goal]
    
    override init(){
    self.balance = 1000
    self.highRiskInvestments = [HighRiskInvestment]()
    self.lowRiskInvestments = [LowRiskInvestment]()
    self.income = 400
    self.manager = Manager()
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
    
    
    func investmentForEnterprise(pEnterprise:Enterprise)->Investment?{
        for hri:HighRiskInvestment in self.highRiskInvestments{
            if (hri.enterprise.id == pEnterprise.id){
                return hri
            }
        }
        return nil
    
    }
    
    
}