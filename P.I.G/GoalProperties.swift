//
//  GoalProperties.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class GoalProperties{

    var goals = [Goal]()
    
    init(){
        

        let t = Tip(paramID: 1, paramDescription: "Você sabia que a poupança é a forma mais segura e mais popular de investir o seu dinheiro? Ela rende 0.05% ao mês do valor total investido. Mas fique atento, ela só renderá se o valor não for modificado. ", paramImageName: "null")
        let g = Goal(paramID: 1, paramDescription: "Investir, no mínimo, $200 cash na Poupança", paramTip: t)
        self.goals.append(g)
        
        
        
    
    
    }
    

}