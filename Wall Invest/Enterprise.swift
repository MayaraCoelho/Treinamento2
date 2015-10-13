//
//  Enterprise.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation


class Enterprise{

    var id:Int
    var name:String
    var value:Float
    var playerPercentage:Float
    var description:String
    var imageName:String

    init(pId:Int, pName:String, pValue:Float, pDescription:String, pImageName:String){
        self.id = pId
        self.name = pName
        self.value = pValue
        self.playerPercentage = 0
        self.description = pDescription
        self.imageName = pImageName
    }

    
    
    
}