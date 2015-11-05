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
        
        let prop1 = Property(pName: "Terreno", pValue: 20000, pReturningMinimumValue: 10, pReturningMaximumValue: 10, pImage: "")
        
        let prop2 = Property(pName: "Apartamento", pValue: 50000, pReturningMinimumValue: 10, pReturningMaximumValue: 20, pImage: "")
        
        let prop3 = Property(pName: "Casa", pValue: 100000, pReturningMinimumValue: 800, pReturningMaximumValue: 1187, pImage: "")
        
        let prop4 = Property(pName: "Condominio Residencial", pValue: 1000000, pReturningMinimumValue: 10, pReturningMaximumValue: 20, pImage: "")
        
        let prop5 = Property(pName: "Shopping Center", pValue: 1000000000, pReturningMinimumValue: 10, pReturningMaximumValue: 20, pImage: "")
        
        let prop6 = Property(pName: "Barraca de Pipoca", pValue: 1000, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "")
        
        let prop7 = Property(pName: "Barraca de Fruta", pValue: 700, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "")
        
        let prop8 = Property(pName: "Motorista de Transporte Alternativo", pValue: 5300, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "")
        
        let prop9 = Property(pName: "Hamburgueria na Zona Sul", pValue: 100000, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "")
        
        let prop10 = Property(pName: "Rede com 5 restaurantes", pValue: 1500000, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "")
        
        properties.append(prop1)
        properties.append(prop2)
        properties.append(prop3)
        properties.append(prop4)
        properties.append(prop5)
        properties.append(prop6)
        properties.append(prop7)
        properties.append(prop8)
        properties.append(prop9)
        properties.append(prop10)
    }

}