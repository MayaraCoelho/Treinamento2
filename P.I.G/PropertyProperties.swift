//
//  PropertyProperties.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class PropertyProperties{
    var properties:[Property]
    
    init(){
        
        self.properties = [Property]()
        
        let p = Property(pName: "Casa", pValue: 100000, pReturningMinimumValue: 800, pReturningMaximumValue: 1187, pImage: "")
        properties.append(p)
    }

}