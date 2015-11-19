//
//  EnterpriseProperties.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation


class EnterpriseProperties{
    
    var enterprises:[Enterprise]
    
    
    init(){
        self.enterprises = [Enterprise]()
        
        let ent1desc = NSLocalizedString("descE1",comment:"")
        let ent1 = Enterprise(pId: 1, pName: NSLocalizedString("nameE1",comment:""), pDescription: ent1desc, pImageName: "EverestOil.png")
        self.enterprises.append(ent1)
        
        let ent2desc = NSLocalizedString("descE2",comment:"")
        let ent2 = Enterprise(pId: 2, pName: NSLocalizedString("nameE2",comment:""), pDescription: ent2desc, pImageName: "BugSoftwareInc.png")
        self.enterprises.append(ent2)
        
        let ent3desc = NSLocalizedString("descE3",comment:"")
        let ent3 = Enterprise(pId: 3, pName: NSLocalizedString("nameE3",comment:""), pDescription: ent3desc, pImageName: "BacompanyHouse.png")
        self.enterprises.append(ent3)
        
        let ent4desc = NSLocalizedString("descE4",comment:"")
        let ent4 = Enterprise(pId: 4, pName: NSLocalizedString("nameE4",comment:""), pDescription: ent4desc, pImageName: "MrAlwaysYoung.png")
        self.enterprises.append(ent4)
        
        let ent5desc = NSLocalizedString("descE5",comment:"")
        let ent5 = Enterprise(pId: 5, pName: NSLocalizedString("nameE5",comment:""), pDescription: ent5desc, pImageName: "ElJuegoZone.png")
        self.enterprises.append(ent5)
        
        let ent6desc = NSLocalizedString("descE6",comment:"")
        let ent6 = Enterprise(pId: 6, pName: NSLocalizedString("nameE6",comment:""), pDescription: ent6desc, pImageName: "TimeNewsCentral.png")
        self.enterprises.append(ent6)
        
        let ent7desc = NSLocalizedString("descE7",comment:"")
        let ent7 = Enterprise(pId: 7, pName: NSLocalizedString("nameE7",comment:""), pDescription: ent7desc, pImageName: "B&C.png")
        self.enterprises.append(ent7)
        
        let ent8desc = NSLocalizedString("descE8",comment:"")
        let ent8 = Enterprise(pId: 8, pName: NSLocalizedString("nameE8",comment:""), pDescription: ent8desc, pImageName: "PhilipHollandBuildings.png")
        self.enterprises.append(ent8)
        
        let ent9desc = NSLocalizedString("descE9",comment:"")
        let ent9 = Enterprise(pId: 9, pName: NSLocalizedString("nameE9",comment:""), pDescription: ent9desc, pImageName: "DumontAircrafts.png")
        self.enterprises.append(ent9)
        
        let ent10desc = NSLocalizedString("descE10",comment:"")
        let ent10 = Enterprise(pId: 10, pName: NSLocalizedString("nameE10",comment:""), pDescription: ent10desc, pImageName: "FastexSA.png")
        self.enterprises.append(ent10)
        
        
    }
    
    
    
}