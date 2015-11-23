//
//  Investment.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Investment:NSObject {
    
    var investedValue:Double
    var currentValue:Double
    
    init(pInvestedValue:Double){
        self.investedValue = pInvestedValue
        self.currentValue = pInvestedValue
    }
    
    

}