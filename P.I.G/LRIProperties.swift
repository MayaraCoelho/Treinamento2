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
    
        let poupanca = LowRiskInvestment(pID: 1, pName: NSLocalizedString("Saving Account", comment: ""), pInterestRates: 0.5, pInvestmentTerm: 86400, pInvestedValue: 0, pImageName: "lowCDB.png")
    
        self.arrayLRI.append(poupanca)
    
        
        let cdb = LowRiskInvestment(pID: 2, pName: NSLocalizedString("CDB", comment: ""), pInterestRates: 0.7, pInvestmentTerm: 259200, pInvestedValue: 0, pImageName: "lowSaving.png")
        
        self.arrayLRI.append(cdb)
        
    }

}