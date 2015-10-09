//
//  Timer.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Timer{
    var startGameTime:NSDate
    var lastUserActivity:NSDate
    var currentDate:NSDate
    
    init(){
        self.startGameTime = NSDate()
        self.lastUserActivity = NSDate()
        self.currentDate = NSDate()
    }
}