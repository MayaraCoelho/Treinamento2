//
//  InflationUpdater.swift
//  PIG
//
//  Created by Henrique do Prado Linhares on 27/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class InflationUpdater{
    
    func update(){
    
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.onlineUpdate()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
    }
    
    
    func onlineUpdate(){
        let url:NSURL = NSURL(string: "http://www.pig.16mb.com/inflation.php")!
        let data:NSData? = NSData(contentsOfURL: url)
        if (data != nil) {
            var str = NSString(data: data!, encoding:NSUTF8StringEncoding)! as String
            str = str.stringByReplacingOccurrencesOfString("\"", withString: "")
            let number = Double(str)
            print("number: \(number) <><><><><><><><><><><><><><><><><><><><>")
            if (number > 1){
                
                AppData.sharedInstance.player.income = AppData.sharedInstance.player.income * number!
                
                for prop:Property in AppData.sharedInstance.properties{
                    prop.value = prop.value * number!
                    prop.returningValue = prop.returningValue * number!
                }
                
                for prop:Property in AppData.sharedInstance.player.properties{
                    prop.value = prop.value * number!
                    prop.returningValue = prop.returningValue * number!
                }
                
            }
            
        }
        
    }



}