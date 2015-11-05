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
        
        for ent:Enterprise in AppData.sharedInstance.enterprises {
            dispatch_async(backgroundQueue, {
                // This is run on the background queue
                ent.update()
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    //This is run on the main queue, after the previous code in outer block
                })
            })
        }
    }
     
    
    func requestEnterpriseValue(enterpriseSufix:String)->Double?{
        
        let url:NSURL = NSURL(string: "http://www.pig.16mb.com/Enterprises/"+enterpriseSufix)!
        let data:NSData = NSData(contentsOfURL: url)!
        let str = NSString(data: data, encoding:NSUTF8StringEncoding)! as NSString
        return Double(str.floatValue)
    }
    
}