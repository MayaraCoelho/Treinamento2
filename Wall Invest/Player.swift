//
//  Player.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Player:NSObject{
    var balance:Float
    var investments:[Investment]
    var salary:Float
    var manager:Manager
    var properties:[Property]
    var goals:[Goal]
    
    override init(){
    self.balance = 1000
    self.investments = [Investment]()
    self.salary = 400
    self.manager = Manager()
    self.properties = [Property]()
    self.goals = [Goal]()
    }

}