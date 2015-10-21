//
//  HighRiskInvestment.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class HighRiskInvestment:Investment, NSCoding {

    var enterprise:Enterprise
    
    init(pEnterprise:Enterprise, pInvestedValue:Double){
    self.enterprise = pEnterprise
    super.init(pInvestedValue: pInvestedValue)
    }

    
    
    
    
    //NSCoding Methods
    @objc required convenience init?(coder decoder: NSCoder) {
     
        guard let dInvestedValue = decoder.decodeObjectForKey("investedValue") as? Double
            else {return nil }
        
        
        guard let dCurrentValue = decoder.decodeObjectForKey("currentValue") as? Double
            else {return nil }
        
 
        guard let dEnterprise = decoder.decodeObjectForKey("enterprise") as? Enterprise
            else {return nil }
        
        self.init(pEnterprise: dEnterprise, pInvestedValue:dInvestedValue)
        self.currentValue = dCurrentValue
    
        
    }
    
    @objc func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.investedValue, forKey: "investedValue")
        coder.encodeObject(self.currentValue, forKey: "currentValue")
        coder.encodeObject(self.enterprise, forKey: "enterprise")

    }

    
    
}