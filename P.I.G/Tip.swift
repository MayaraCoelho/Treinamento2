//
//  Tip.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Tip{

    var id:Int
    var description:String
    var imageName:String
    
    init (paramID:Int, paramDescription:String, paramImageName:String){
        self.id = paramID
        self.description = paramDescription
        self.imageName = paramImageName
    }
    
}