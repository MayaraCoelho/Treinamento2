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
        
        let prop1 = Property(pID:7,pName: NSLocalizedString( "Barraca de Fruta",comment:""), pValue: 700, pReturningValue:10 , pImage: "fruitIcon.png")
        
        let prop2 = Property(pID:6,pName: NSLocalizedString("Barraca de Pipoca",comment:"") , pValue: 1000, pReturningValue: 10, pImage: "popcornIcon.png")
        
        let prop3 = Property(pID:8,pName: NSLocalizedString("Motorista de Transporte Alternativo",comment:"") , pValue: 5300, pReturningValue: 10,  pImage: "taxiIcon.png")
        
        let prop4 = Property(pID:1, pName: NSLocalizedString("Terreno",comment:""), pValue: 20000, pReturningValue:10, pImage: "landIcon.png")
        
        let prop5 = Property(pID:2,pName: NSLocalizedString("Apartamento",comment:""), pValue: 50000, pReturningValue:10, pImage: "buildingIcon.png")
        
        let prop6 = Property(pID:3,pName: NSLocalizedString("Casa",comment:"") , pValue: 100000, pReturningValue: 800, pImage: "houseIcon.png")
        
        let prop7 = Property(pID:9,pName: NSLocalizedString("Hamburgueria na Zona Sul",comment:""), pValue: 120000, pReturningValue: 10, pImage: "burgerIcon.png")
        
        let prop8 = Property(pID:10,pName: NSLocalizedString("Rede com 5 restaurantes",comment:""), pValue: 1500000, pReturningValue:10, pImage: "franchiseIcon.png")
        
        let prop9 = Property(pID:4,pName: NSLocalizedString("Condominio Residencial",comment:""), pValue: 1000000, pReturningValue: 10, pImage: "jointIcon.png")
        
        let prop10 = Property(pID:5,pName: NSLocalizedString("Shopping Center",comment:""), pValue: 1000000000, pReturningValue:10, pImage: "shopIcon.png")

        
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