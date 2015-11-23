//
//  HighRiskInvestment.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class HighRiskInvestment:Investment, NSCoding {

    var enterpriseID:Int
    var lastEnterpriseValue:Double
    var taxes = 0.12
    
    init(pEnterpriseID:Int, pInvestedValue:Double){
        self.enterpriseID = pEnterpriseID
        self.lastEnterpriseValue = (AppData.sharedInstance.enterpriseByID(pEnterpriseID)?.stockValue)!
        super.init(pInvestedValue: pInvestedValue)
    }

    
    //NSCoding Methods
    @objc required convenience init?(coder decoder: NSCoder) {
     
        guard let dInvestedValue = decoder.decodeObjectForKey("investedValue") as? Double
            else {return nil }
        
        
        guard let dCurrentValue = decoder.decodeObjectForKey("currentValue") as? Double
            else {return nil }
        
 
        guard let dEnterpriseID = decoder.decodeObjectForKey("enterpriseID") as? Int
            else {return nil }
        
        guard let dLastEnterpriseValue = decoder.decodeObjectForKey("lastEnterpriseValue") as? Double
            else {return nil }
        
        self.init(pEnterpriseID: dEnterpriseID, pInvestedValue:dInvestedValue)
        self.currentValue = dCurrentValue
        self.lastEnterpriseValue = dLastEnterpriseValue
    }
    
    @objc func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.investedValue, forKey: "investedValue")
        coder.encodeObject(self.currentValue, forKey: "currentValue")
        coder.encodeObject(self.enterpriseID, forKey: "enterpriseID")
        coder.encodeObject(self.lastEnterpriseValue, forKey: "lastEnterpriseValue")

    }
    
    func update(){
        let enterprise = AppData.sharedInstance.enterpriseByID(self.enterpriseID)
        let ratio = (enterprise?.stockValue)! / self.lastEnterpriseValue
        self.currentValue = self.currentValue * ratio
        self.lastEnterpriseValue = (enterprise?.stockValue)!
    }
    
}