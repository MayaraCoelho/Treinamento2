//
//  Enterprise.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation


class Enterprise:NSObject, NSCoding {

    var id:Int
    var name:String
    var value:Double
    var playerPercentage:Float
    var descript:String
    var imageName:String

    init(pId:Int, pName:String, pValue:Double, pDescription:String, pImageName:String){
        self.id = pId
        self.name = pName
        self.value = pValue
        self.playerPercentage = 0
        self.descript = pDescription
        self.imageName = pImageName
    }

   
    //NSCoding Methods
    required convenience init?(coder decoder: NSCoder) {
        
        guard let dID = decoder.decodeObjectForKey("id") as? Int
            else {return nil }
        
        guard let dName = decoder.decodeObjectForKey("name") as? String
            else {return nil }

        guard let dValue = decoder.decodeObjectForKey("value") as? Double
            else {return nil }
        
        
        guard let dPlayerPercentage = decoder.decodeObjectForKey("playerPercentage") as? Float
            else {return nil }
        
        guard let dDescript = decoder.decodeObjectForKey("descript") as? String
            else {return nil }
        
        guard let dImageName = decoder.decodeObjectForKey("imageName") as? String
            else {return nil }
        
        self.init(pId:dID, pName:dName, pValue:dValue, pDescription:dDescript, pImageName:dImageName)
        self.playerPercentage = dPlayerPercentage
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id, forKey: "id")
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.value, forKey: "value")
        coder.encodeObject(self.playerPercentage, forKey: "playerPercentage")
        coder.encodeObject(self.descript, forKey: "descript")
        coder.encodeObject(self.imageName, forKey: "imageName")

        
    }
    
    
}