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

    
    
    private func updateEverestOil(){
        
        print("Everest Oil Update Started")
        
        var sum:Double = 0;
        
        //Exxon Mobil Corporation
        var url:NSURL = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=XOM+&f=b")!
        var data:NSData = NSData(contentsOfURL: url)!
        var number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = Double(number!)
        
        //General Electric Company
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=GE+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Chevron Company
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=CVX+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //PetroChina Company
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=PTR+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //British Petroil
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=BP+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
    
        AppData.sharedInstance.enterprises[0].value = sum
        
        print("Everest Oil Update finished")
        
    }
    
    private func updateBugSoftwareInc(){
        
        print("Bug Software Inc Update Started")
        
        var sum:Double = 0;
        
        //Apple
        var url:NSURL = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=AAPL+&f=b")!
        var data:NSData = NSData(contentsOfURL: url)!
        var number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = Double(number!)
        
        //Google
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=GOOG+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Microsoft
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=MSFT+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Facebook
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=FB+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Oracle
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=ORCL+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        AppData.sharedInstance.enterprises[1].value = sum
        
        print("Bug Software Inc Update finished")
        
    }
    
    private func updateBacompanyHouse(){
        
        print("Bacompany House Update Started")
        
        var sum:Double = 0;
        
        //Kraft Heinz Company
        var url:NSURL = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=KHC+&f=b")!
        var data:NSData = NSData(contentsOfURL: url)!
        var number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = Double(number!)
        
        //Mondelez International
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=MDLZ+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Monster Beverage
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=MNST+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Pilgrim Pride Corporation
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=PPC+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Blue Buffalo Products
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=BUFF+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        AppData.sharedInstance.enterprises[2].value = sum
        
        print("Bacompany House Update finished")
        
    
    }
    
    private func updateMrAlwaysYoung(){
        
        print("Mr Always Young Update Started")
        
        var sum:Double = 0;
        
        //Abercrombie & Fitch Company
        var url:NSURL = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=ANF+&f=b")!
        var data:NSData = NSData(contentsOfURL: url)!
        var number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = Double(number!)
        
        //Ross Stores
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=ROST+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //L Brands
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=LB+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Gap inc
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=GPS+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        //Urban Outfiters
        url = NSURL(string: "http://finance.yahoo.com/d/quotes.csv?s=URBN+&f=b")!
        data = NSData(contentsOfURL: url)!
        number = NSString(data: data, encoding:NSUTF8StringEncoding)?.floatValue
        sum = sum + Double(number!)
        
        AppData.sharedInstance.enterprises[3].value = sum
        
        print("Mr Always Young Update finished")
    
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