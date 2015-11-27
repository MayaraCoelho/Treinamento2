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
    
        let poupanca = LowRiskInvestment(pID: 1, pName: NSLocalizedString("Saving Account", comment: ""), pDescript: "Poupança é uma das aplicações financeiras mais tradicionais do mercado. É um investimento seguro. Seu dinheiro irá render 0.5% ao dia.", pInterestRates: 0.05, pInvestmentTerm: 86400, pStartDate:NSDate(), pInvestedValue: 0, pImageName: "lowCDB.png")
    
        self.arrayLRI.append(poupanca)
    
        
        let cdb = LowRiskInvestment(pID: 2, pName: NSLocalizedString("CDB", comment: ""),pDescript:"É como se você emprestasse seu dinheiro para o banco. Escolha um valor e um prazo, e ao final deste prazo você poderá resgatar seu dinheiro com juros", pInterestRates: 0.7, pInvestmentTerm: 0,pStartDate:NSDate(),  pInvestedValue: 0, pImageName: "lowSaving.png")
        
        self.arrayLRI.append(cdb)
        
    }

}