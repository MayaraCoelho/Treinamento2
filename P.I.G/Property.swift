//
//  Property.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation
import UIKit

class Property:NSObject, NSCoding{

    var id:Int
    var name:String
    var value:Double
    var baseValue:Double
    var returningValue:Double
    var baseReturningValue:Double
    var imageName:String
    
    
    init(pID:Int, pName:String, pValue:Double, pBaseValue:Double, pReturningValue:Double, pBaseReturningValue:Double, pImage:String){
        self.id = pID
        self.name = pName
        self.value = pValue
        self.baseValue = pBaseValue
        self.returningValue = pReturningValue
        self.baseReturningValue = pBaseReturningValue
        self.imageName = pImage
    }
    
    init(pID:Int, pName:String, pValue:Double, pReturningValue:Double, pImage:String){
        self.id = pID
        self.name = pName
        self.value = pValue
        self.baseValue = pValue
        self.returningValue = pReturningValue
        self.baseReturningValue = pReturningValue
        self.imageName = pImage
    }
    
    
    func generateReturningValue(){
    
    }
    
    func icon()->UIImage?{
        return UIImage(named: self.imageName)
    }
    
    
    //NSCoding Methods
    required convenience init?(coder decoder: NSCoder) {
        
        guard let dID = decoder.decodeObjectForKey("ID") as? Int
            else {return nil }
        
        
        guard let dName = decoder.decodeObjectForKey("Name") as? String
            else {return nil }
        
        
        guard let dValue = decoder.decodeObjectForKey("value") as? Double
            else {return nil }
        
        guard let dBaseValue = decoder.decodeObjectForKey("baseValue") as? Double
            else {return nil }
        
        guard let dReturningValue = decoder.decodeObjectForKey("returningValue") as? Double
            else {return nil }
        
        guard let dBaseReturningValue = decoder.decodeObjectForKey("baseReturningValue") as? Double
            else {return nil }
        
        guard let dImageName = decoder.decodeObjectForKey("imageName") as? String
            else {return nil }
    
        self.init(pID: dID, pName: dName, pValue: dValue, pBaseValue:dBaseValue, pReturningValue:dReturningValue, pBaseReturningValue:dBaseReturningValue, pImage:dImageName)
    }
    
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id, forKey: "ID")
        coder.encodeObject(self.name, forKey: "Name")
        coder.encodeObject(self.value, forKey: "value")
        coder.encodeObject(self.baseValue, forKey: "baseValue")
        coder.encodeObject(self.returningValue, forKey: "returningValue")
        coder.encodeObject(self.baseReturningValue, forKey: "baseReturningValue")
        coder.encodeObject(self.imageName, forKey: "imageName")
    }
    
    
}