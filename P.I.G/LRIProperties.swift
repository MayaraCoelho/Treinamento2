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
    
        let poupanca = LowRiskInvestment(pID: 1, pName: NSLocalizedString("Saving Account", comment: ""), pDescript: "Descript da poupanca", pInterestRates: 0.05, pInvestmentTerm: 86400, pStartDate:NSDate(), pInvestedValue: 0, pImageName: "lowCDB.png", pTaxes: 0.0)
    
        self.arrayLRI.append(poupanca)
    
        
        let cdb = LowRiskInvestment(pID: 2, pName: NSLocalizedString("CDB", comment: ""),pDescript:"descript do cdb", pInterestRates: 0.7, pInvestmentTerm: 0,pStartDate:NSDate(),  pInvestedValue: 0, pImageName: "lowSaving.png", pTaxes: 0.08)
        
        self.arrayLRI.append(cdb)
        
    }

}