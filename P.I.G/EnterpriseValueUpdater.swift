//
//  EnterpriseValueUpdater.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 22/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class EnterpriseValueUpdater{
    
    func updateAllEnterprises(){
        
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        

            dispatch_async(backgroundQueue, {
                // This is run on the background queue
                self.requestEnterpriseValue()
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    //This is run on the main queue, after the previous code in outer block
                })
            })
        
    }
     
    
    func requestEnterpriseValue(){

        let url:NSURL = NSURL(string: "http://www.pig.16mb.com/Enterprises/all.php")!
        let data:NSData? = NSData(contentsOfURL: url)
        if (data != nil) {
            var str = NSString(data: data!, encoding:NSUTF8StringEncoding)! as String
            
            str = str.stringByReplacingOccurrencesOfString("\"", withString: "")
            let strArray = str.componentsSeparatedByString(";")
            var count = 0
            for ent:Enterprise in AppData.sharedInstance.enterprises {
                ent.updateStockValue((strArray[count] as NSString).doubleValue)
                count = count + 1
            }
            
        
        }
    
    }
    
 
    
}