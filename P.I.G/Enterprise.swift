//
//  Enterprise.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation
import UIKit


class Enterprise:NSObject, NSCoding {

    var id:Int
    var name:String
    var stockValue:Double
    var lastValue:Double
    var playerPercentage:Float
    var descript:String
    var imageName:String
    
    //Used in EnterpriseProperties, to make the first init of an Enterprise
    init(pId:Int, pName:String, pDescription:String, pImageName:String){
        self.id = pId
        self.name = pName
        self.stockValue = 0
        self.lastValue = 0
        self.playerPercentage = 0
        self.descript = pDescription
        self.imageName = pImageName

    }

    //Used in NSCoding init, to init from a encoded state
    init(pId:Int, pName:String, pValue:Double, pLastValue:Double, pDescription:String, pImageName:String){
        self.id = pId
        self.name = pName
        self.stockValue = pValue
        self.lastValue = pLastValue
        self.playerPercentage = 0
        self.descript = pDescription
        self.imageName = pImageName
    }

    func icon()->UIImage?{
        return UIImage(named: self.imageName)
    }
    
    
   
    //NSCoding Methods
    required convenience init?(coder decoder: NSCoder) {
        
        guard let dID = decoder.decodeObjectForKey("id") as? Int
            else {return nil }
        
        guard let dName = decoder.decodeObjectForKey("name") as? String
            else {return nil }

        guard let dValue = decoder.decodeObjectForKey("value") as? Double
            else {return nil }
        
        guard let dLastValue = decoder.decodeObjectForKey("lastValue") as? Double
            else {return nil }
        
        guard let dPlayerPercentage = decoder.decodeObjectForKey("playerPercentage") as? Float
            else {return nil }
        
        guard let dDescript = decoder.decodeObjectForKey("descript") as? String
            else {return nil }
        
        guard let dImageName = decoder.decodeObjectForKey("imageName") as? String
            else {return nil }
        
        
        
        self.init(pId:dID, pName:dName, pValue:dValue, pLastValue:dLastValue, pDescription:dDescript, pImageName:dImageName)
        self.playerPercentage = dPlayerPercentage
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id, forKey: "id")
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.stockValue, forKey: "value")
        coder.encodeObject(self.lastValue, forKey: "lastValue")
        coder.encodeObject(self.playerPercentage, forKey: "playerPercentage")
        coder.encodeObject(self.descript, forKey: "descript")
        coder.encodeObject(self.imageName, forKey: "imageName")
    }
    
    func update(){
        
        print("\(self.name) Update started. ")
        
        let sufix = (self.name.stringByReplacingOccurrencesOfString(" ", withString: ""))+".php"
        
        let requestedValue = EnterpriseValueUpdater().requestEnterpriseValue(sufix)!
        
        if (requestedValue > 0){
            self.lastValue = self.stockValue
            self.stockValue = requestedValue
            if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(self)){
                AppData.sharedInstance.player.highRiskInvestmentForEnterprise(self)?.update()
            }
        }
        print("\(self.name) Update finished. Value:\(self.stockValue) ")
       // EnterprisesDAO.sharedInstance.saveEnterprises()
    }
    
}