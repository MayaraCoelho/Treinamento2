//
//  LRIProperties.swift
//  P.I.G
//
//  Created by Mayara Coelho on 11/9/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class LRIProperties{
    var arrayLRI = [LowRiskInvestment]()
    
    init(){
    
    let poupanca = LowRiskInvestment(pName: "Saving Account", pInterestRates: 0.5, pInvestmentTerm: 86400, pInvestedValue: 0)
    
    self.arrayLRI.append(poupanca)
    
        
    let cdb = LowRiskInvestment(pName: "CDB", pInterestRates: 0.7, pInvestmentTerm: 259200, pInvestedValue: 0)
        
    self.arrayLRI.append(cdb)
        
    }

}