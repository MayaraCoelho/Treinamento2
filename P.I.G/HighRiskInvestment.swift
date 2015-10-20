//
//  HighRiskInvestment.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class HighRiskInvestment:Investment{

    var enterprise:Enterprise
    
    init(pEnterprise:Enterprise, pInvestedValue:Double){
    self.enterprise = pEnterprise
    super.init(pInvestedValue: pInvestedValue)
    }


}