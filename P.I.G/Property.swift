//
//  Property.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Property{

    var name:String
    var value:Float
    var returningMiniumValue:Float
    var returningMaximumValue:Float
    var imageName:String
    
    
    init(pName:String, pValue:Float, pReturningMinimumValue:Float, pReturningMaximumValue:Float, pImage:String){
        self.name = pName
        self.value = pValue
        self.returningMiniumValue = pReturningMinimumValue
        self.returningMaximumValue = pReturningMaximumValue
        self.imageName = pImage
    }
    
    
    func generateReturningValue(){
    
    }
    
}