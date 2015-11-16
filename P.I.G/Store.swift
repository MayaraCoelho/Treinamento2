//
//  Store.swift
//  Wall Investterm
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Store{
    var properties:[Property]
    
    init(){
        let propertiesInstance = PropertyProperties()
        self.properties = propertiesInstance.properties
    }
    
    func buyProperty(){
        //check if player has properties

    }
    
    func sellProperty(){
    }
    
    
}