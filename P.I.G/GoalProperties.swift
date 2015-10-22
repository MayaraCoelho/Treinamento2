//
//  GoalProperties.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class GoalProperties{

    var goals:[Goal]
    
    init(){
        
        self.goals = [Goal]()
        let t = Tip(paramID: 1, paramDescription: "Tip description 01", paramImageName: "null")
        let g = Goal(paramID: 1, paramDescription: "Description 01", paramTip: t)
        self.goals.append(g)
    
    
    }
    

}