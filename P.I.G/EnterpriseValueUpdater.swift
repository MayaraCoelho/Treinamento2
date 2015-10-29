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
    
    
    
    
    private func requestEnterpriseValue(enterpriseCode:String)->Double?{
        
        let url:NSURL = NSURL(string: "http://marketdata.websol.barchart.com/getQuote.csv?key=9562e60e190ec0e2e5e43aacfc0ce789&symbols="+enterpriseCode+"&mode=R")!
        let data:NSData = NSData(contentsOfURL: url)!
        let str = NSString(data: data, encoding:NSUTF8StringEncoding)
        let strSplitted = str?.componentsSeparatedByString(",")
        let num = strSplitted![22].stringByReplacingOccurrencesOfString("\"", withString: "") as NSString
        return Double(num.floatValue)
    }
    
    
    private func updateEverestOil(){
        
        print("Everest Oil Update Started")
        
        var sum:Double = 0;
        
        //Exxon Mobil Corporation
        sum = requestEnterpriseValue("XOM")!
        
        //Chevron Company
        sum = sum + 3*requestEnterpriseValue("CVX")!
        
        //PetroChina Company
        sum = sum + 5*requestEnterpriseValue("PTR")!
        
        //British Petroil
        sum = sum + requestEnterpriseValue("BP")!
        
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
        sum = 2*requestEnterpriseValue("AAPL")!
        
        //Google
        sum = sum + 5*requestEnterpriseValue("GOOG")!
        
        //Microsoft
        sum = sum + 3*requestEnterpriseValue("MSFT")!
        
        //Facebook
        sum = sum + requestEnterpriseValue("FB")!
        
        //Oracle
        sum = sum + 10*requestEnterpriseValue("ORCL")!
        
        AppData.sharedInstance.enterprises[1].stockValue = sum
        
        print("Bug Software Inc Update finished. Value:\(sum) ")
        
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(AppData.sharedInstance.enterpriseByID(2)!)){
            AppData.sharedInstance.player.highRiskInvestmentForEnterprise(AppData.sharedInstance.enterpriseByID(2)!)?.update()
        }
        
    }
    
    private func updateBacompanyHouse(){
        
        print("Bacompany House Update Started")
        
        var sum:Double = 0;
        
        //Kraft Heinz Company
        sum = 9*requestEnterpriseValue("KHC")!
        
        //Mondelez International
        sum = sum + 4*requestEnterpriseValue("MDLZ")!
        
        //Monster Beverage
        sum = sum + 4*requestEnterpriseValue("MNST")!
        
        //Pilgrim Pride Corporation
        sum = sum + 2*requestEnterpriseValue("PPC")!
        
        AppData.sharedInstance.enterprises[2].stockValue = sum
        
        print("Bacompany House Update finished. Value:\(sum) ")
        
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(AppData.sharedInstance.enterpriseByID(3)!)){
            AppData.sharedInstance.player.highRiskInvestmentForEnterprise(AppData.sharedInstance.enterpriseByID(3)!)?.update()
        }
    }
    
    private func updateMrAlwaysYoung(){
        
        print("Mr Always Young Update Started")
        
        var sum:Double = 0;
        
        //Abercrombie & Fitch Company
        sum = requestEnterpriseValue("ANF")!
        
        //L Brands
        sum = sum + 4*requestEnterpriseValue("LB")!
        
        //Gap inc
        sum = sum + 10*requestEnterpriseValue("GPS")!
        
        //Urban Outfiters
        sum = sum + 5*requestEnterpriseValue("URBN")!
        
        AppData.sharedInstance.enterprises[3].stockValue = sum
        
        print("Mr Always Young Update finished. Value:\(sum) ")
        
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(AppData.sharedInstance.enterpriseByID(4)!)){
            AppData.sharedInstance.player.highRiskInvestmentForEnterprise(AppData.sharedInstance.enterpriseByID(4)!)?.update()
        }
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