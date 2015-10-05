//
//  LowRiskInvestment.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class LowRiskInvestment:Investment{

    var name:String
    var interestRates:Float
    var investmentTerm:NSTimeInterval
    
     init(pName:String, pInterestRates:Float, pInvestmentTerm:NSTimeInterval) {
        self.name = pName
        self.interestRates = pInterestRates
        self.investmentTerm = pInvestmentTerm
        
        
    }
    
}