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
        
        let prop1 = Property(pID:7,pName: "Barraca de Fruta", pValue: 700, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "fruitIcon.png")
        
        let prop2 = Property(pID:6,pName: "Barraca de Pipoca", pValue: 1000, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "popcornIcon.png")
        
        let prop3 = Property(pID:8,pName: "Motorista de Transporte Alternativo", pValue: 5300, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "taxiIcon.png")
        
        let prop4 = Property(pID:1, pName: "Terreno", pValue: 20000, pReturningMinimumValue: 10, pReturningMaximumValue: 10, pImage: "landIcon.png")
        
        let prop5 = Property(pID:2,pName: "Apartamento", pValue: 50000, pReturningMinimumValue: 10, pReturningMaximumValue: 20, pImage: "buildingIcon.png")
        
        let prop6 = Property(pID:3,pName: "Casa", pValue: 100000, pReturningMinimumValue: 800, pReturningMaximumValue: 1187, pImage: "houseIcon.png")
        
        let prop7 = Property(pID:9,pName: "Hamburgueria na Zona Sul", pValue: 120000, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "burgerIcon.png")
        
        let prop8 = Property(pID:10,pName: "Rede com 5 restaurantes", pValue: 1500000, pReturningMinimumValue: 10, pReturningMaximumValue: 100, pImage: "franchiseIcon.png")
        
        let prop9 = Property(pID:4,pName: "Condominio Residencial", pValue: 1000000, pReturningMinimumValue: 10, pReturningMaximumValue: 20, pImage: "jointIcon.png")
        
        let prop10 = Property(pID:5,pName: "Shopping Center", pValue: 1000000000, pReturningMinimumValue: 10, pReturningMaximumValue: 20, pImage: "shopIcon.png")

        
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