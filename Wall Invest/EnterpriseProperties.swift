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
        
        let ent1desc = "Founded in Saudi Arabia, 1931, is the largest oil company in the world, responsible for the sale of about 400 barrels of oil a day to the United States."
        let ent1 = Enterprise(pId: 1, pName: "Everest Oil", pValue: 180000000000, pDescription: ent1desc, pImageName: "everestOil.png")
        self.enterprises.append(ent1)
        
        let ent2desc = "Founded in 1980 by the student Frank Roy, acts creating powerful systems that changed the daily life of our society."
        let ent2 = Enterprise(pId: 2, pName: "Bug Software Inc", pValue: 70000000000, pDescription: ent2desc, pImageName: "bugSoftwareInc.png")
        self.enterprises.append(ent2)
        
        let ent3desc = "Brazilian corporation founded by the junction of the two largest food companies."
        let ent3 = Enterprise(pId: 3, pName: "Bacompany House", pValue: 32000000000, pDescription: ent3desc, pImageName: "bacompany.png")
        self.enterprises.append(ent3)
        
        let ent4desc = "The French designer Amélie DeLarge created a small clothing store that has expanded and today has become a worldwide fashion icon."
        let ent4 = Enterprise(pId: 4, pName: "Mr Always Young", pValue: 270000000, pDescription: ent4desc, pImageName: "mrAlwaysYoung.jpg")
        self.enterprises.append(ent4)

        let ent5desc = "Company founded by three students from the University of Mexico specializes in developing highly regarded games as Nachos Locos."
        let ent5 = Enterprise(pId: 5, pName: "El Juego Zone", pValue: 700000000, pDescription: ent5desc, pImageName: "elJuegoZone.png")
        self.enterprises.append(ent5)
        
        let ent6desc = "Media company that reaches the height of its success in 2005, due to the launch of a tabloid in Russia."
        let ent6 = Enterprise(pId: 6, pName: "Time News Central", pValue: 25000000000, pDescription: ent6desc, pImageName: "news.jpg")
        self.enterprises.append(ent6)
        
        let ent7desc = "Founded in 1910 by the couple Barney and Clara, is considered the largest bank for investment from all over Europe."
        let ent7 = Enterprise(pId: 7, pName: "B&C", pValue: 380000000000, pDescription: ent7desc, pImageName: "bank.gif")
        self.enterprises.append(ent7)
        
        let ent8desc = "It was founded by engineer Philip Holland in England, and is responsible for the largest buildings of the contemporary world."
        let ent8 = Enterprise(pId: 8, pName: "Philip Holland Buildings", pValue: 900000000, pDescription: ent8desc, pImageName: "building.jpg")
        self.enterprises.append(ent8)
        
        let ent9desc = "Founded in Argentina in 1990, manufactures aircraft of all sizes and are famous for their excellent performance."
        let ent9 = Enterprise(pId: 9, pName: "Dumont Aircrafts", pValue: 15000000000, pDescription: ent9desc, pImageName: "14bis.jpg")
        self.enterprises.append(ent9)
        
        let ent10desc = "Startup created by retired postman George, it offers an unique service that takes your order anywhere in the world in 24 hours."
        let ent10 = Enterprise(pId: 10, pName: "Fastex S/A", pValue: 5000000000, pDescription: ent10desc, pImageName: "fast.png")
        self.enterprises.append(ent10)
        
    
    }



}