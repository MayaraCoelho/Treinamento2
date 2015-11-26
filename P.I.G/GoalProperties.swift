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
        
        let t1 = Tip(paramID: 1, paramDescription: "Você sabia que a poupança é a forma mais segura e mais popular de investir o seu dinheiro? Ela rende 0.05% ao mês do valor total investido. Mas fique atento, ela só renderá se o valor não for modificado. ", paramImageName: "null")
        let g1 = Goal(paramID: 1, paramDescription: "Comprar uma barraca de fruta ou barraca de pipoca", paramTip: t1)
        self.goals.append(g1)
        
        let t2 = Tip(paramID: 1, paramDescription: "Você sabia que a poupança é a forma mais segura e mais popular de investir o seu dinheiro? Ela rende 0.05% ao mês do valor total investido. Mas fique atento, ela só renderá se o valor não for modificado. ", paramImageName: "null")
        let g2 = Goal(paramID: 1, paramDescription: "Investir seu salário diário na CDB", paramTip: t2)
        self.goals.append(g2)
        
        let t3 = Tip(paramID: 1, paramDescription: "Você sabia que a poupança é a forma mais segura e mais popular de investir o seu dinheiro? Ela rende 0.05% ao mês do valor total investido. Mas fique atento, ela só renderá se o valor não for modificado. ", paramImageName: "null")
        let g3 = Goal(paramID: 1, paramDescription: "Resgatar $240 cash na Poupança", paramTip: t3)
        self.goals.append(g3)
        
        let t4 = Tip(paramID: 1, paramDescription: "Você sabia que a poupança é a forma mais segura e mais popular de investir o seu dinheiro? Ela rende 0.05% ao mês do valor total investido. Mas fique atento, ela só renderá se o valor não for modificado. ", paramImageName: "null")
        let g4 = Goal(paramID: 1, paramDescription: "Investir 20% dos seus recursos em uma Renda Variável", paramTip: t4)
        self.goals.append(g4)
        
        let t5 = Tip(paramID: 1, paramDescription: "Você sabia que a poupança é a forma mais segura e mais popular de investir o seu dinheiro? Ela rende 0.05% ao mês do valor total investido. Mas fique atento, ela só renderá se o valor não for modificado. ", paramImageName: "null")
        let g5 = Goal(paramID: 1, paramDescription: "Investir $1.200 no CDB", paramTip: t5)
        self.goals.append(g5)
        
        let t6 = Tip(paramID: 1, paramDescription: "Você sabia que a poupança é a forma mais segura e mais popular de investir o seu dinheiro? Ela rende 0.05% ao mês do valor total investido. Mas fique atento, ela só renderá se o valor não for modificado. ", paramImageName: "null")
        let g6 = Goal(paramID: 1, paramDescription: "Investir $300 cash na Poupança e resgatar em 48 horas", paramTip: t6)
        self.goals.append(g6)
        
        
        
    }
    
    
}