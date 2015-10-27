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
        
        //Dispatch to enterprise value updater to background
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateEverestOil()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateBugSoftwareInc()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateBacompanyHouse()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateMrAlwaysYoung()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateElJuegoZone()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateTimeNewsCentral()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
       
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateBandC()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updatePhilipHollandBuildings()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateDumontAircrafts()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
        dispatch_async(backgroundQueue, {
            // This is run on the background queue
            self.updateFastexSA()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                //This is run on the main queue, after the previous code in outer block
            })
        })
        
    }

    
    
    
    private func httpRequest(stringUrl:String)->Double?{
    
        let url:NSURL = NSURL(string: stringUrl)!
        let data:NSData = NSData(contentsOfURL: url)!
        let number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        return Double(number!)
    
    }
    
    
    private func updateEverestOil(){
        
        print("Everest Oil Update Started")
        
        var sum:Double = 0;
        
        //Exxon Mobil Corporation
        sum = httpRequest("http://finance.yahoo.com/d/quotes.csv?s=XOM+&f=b")!
        
        //General Electric Company
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=GE+&f=b")!
        
        //Chevron Company
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=CVX+&f=b")!
        
        //PetroChina Company
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=PTR+&f=b")!
        
        //British Petroil
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=BP+&f=b")!
    
        AppData.sharedInstance.enterprises[0].stockValue = sum
        
        print("Everest Oil Update finished. Value:\(sum) ")
        
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(AppData.sharedInstance.enterpriseByID(1)!)){
            AppData.sharedInstance.player.highRiskInvestmentForEnterprise(AppData.sharedInstance.enterpriseByID(1)!)?.update()
        }
    }
    
    
    private func updateBugSoftwareInc(){
        
        print("Bug Software Inc Update Started")
        
        var sum:Double = 0;
        
        //Apple
        sum = httpRequest("http://finance.yahoo.com/d/quotes.csv?s=AAPL+&f=b")!
        
        //Google
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=GOOG+&f=b")!
        
        //Microsoft
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=MSFT+&f=b")!
        
        //Facebook
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=FB+&f=b")!
        
        //Oracle
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=ORCL+&f=b")!
        
        AppData.sharedInstance.enterprises[1].stockValue = sum
        
        print("Bug Software Inc Update finished. Value:\(sum) ")
        
    }
    
    private func updateBacompanyHouse(){
        
        print("Bacompany House Update Started")
        
        var sum:Double = 0;
        
        //Kraft Heinz Company
        sum = httpRequest("http://finance.yahoo.com/d/quotes.csv?s=KHC+&f=b")!
        
        //Mondelez International
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=MDLZ+&f=b")!
        
        //Monster Beverage
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=MNST+&f=b")!
        
        //Pilgrim Pride Corporation
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=PPC+&f=b")!
        
        //Blue Buffalo Products
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=BUFF+&f=b")!
        
        AppData.sharedInstance.enterprises[2].stockValue = sum
        
        print("Bacompany House Update finished. Value:\(sum) ")
    }
    
    private func updateMrAlwaysYoung(){
        
        print("Mr Always Young Update Started")
        
        var sum:Double = 0;
        
        //Abercrombie & Fitch Company
        sum = httpRequest("http://finance.yahoo.com/d/quotes.csv?s=ANF+&f=b")!
        
        //Ross Stores
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=ROST+&f=b")!
        
        //L Brands
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=LB+&f=b")!
        
        //Gap inc
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=GPS+&f=b")!
        
        //Urban Outfiters
        sum = sum + httpRequest("http://finance.yahoo.com/d/quotes.csv?s=URBN+&f=b")!
        
        AppData.sharedInstance.enterprises[3].stockValue = sum 
        
        print("Mr Always Young Update finished. Value:\(sum) ")
    
    }
    
    private func updateElJuegoZone(){
    
    }
    
    private func updateTimeNewsCentral(){
    
    }
    
    private func updateBandC(){
    
    }
    
    private func updatePhilipHollandBuildings(){
    
    }
    
    private func updateDumontAircrafts(){
    
    }
    
    private func updateFastexSA(){
    
    }


}