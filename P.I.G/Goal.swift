//
//  Goal.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Goal{
    
    var id:Int
    var description:String
    var hasBeenReached:Bool
    var tip:Tip?

    init(paramID:Int, paramDescription:String, paramTip:Tip){
        self.id = paramID
        self.description = paramDescription
        self.hasBeenReached = false
        self.tip = paramTip
    }
    
    init(paramID:Int, paramDescription:String){
        self.id = paramID
        self.description = paramDescription
        self.hasBeenReached = false
    }
    
    
}