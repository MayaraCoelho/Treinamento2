//
//  Property.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation
import UIKit

class Property{

    var id:Int
    var name:String
    var value:Double
    var returningMiniumValue:Float
    var returningMaximumValue:Float
    var imageName:String
    
    
    init(pID:Int, pName:String, pValue:Double, pReturningMinimumValue:Float, pReturningMaximumValue:Float, pImage:String){
        self.id = pID
        self.name = pName
        self.value = pValue
        self.returningMiniumValue = pReturningMinimumValue
        self.returningMaximumValue = pReturningMaximumValue
        self.imageName = pImage
    }
    
    
    func generateReturningValue(){
    
    }
    
    
    func icon()->UIImage?{
        return UIImage(named: self.imageName)
    }
    
}