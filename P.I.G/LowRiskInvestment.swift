//
//  LowRiskInvestment.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation
import UIKit

class LowRiskInvestment:Investment, NSCoding{

    var id:Int
    var name:String
    var descript:String
    var interestRates:Float
    var investmentTerm:NSTimeInterval
    var startDate:NSDate
    var imageName: String
    
    
    init(pID:Int, pName:String, pDescript:String, pInterestRates:Float, pInvestmentTerm:NSTimeInterval, pStartDate:NSDate, pInvestedValue:Double, pImageName: String) {
        self.id = pID
        self.name = pName
        self.descript = pDescript
        self.interestRates = pInterestRates
        self.investmentTerm = pInvestmentTerm
        self.startDate = pStartDate
        self.imageName = pImageName
        super.init(pInvestedValue: pInvestedValue)
    }
    
    func icon()->UIImage?
    {
        return UIImage(named: self.imageName)
    }
    
    
    //NSCoding Methods
    @objc required convenience init?(coder decoder: NSCoder) {
        
        guard let dInvestedValue = decoder.decodeObjectForKey("investedValue") as? Double
            else {return nil }
        
        
        guard let dCurrentValue = decoder.decodeObjectForKey("currentValue") as? Double
            else {return nil }
        
        
        guard let dID = decoder.decodeObjectForKey("LRI-ID") as? Int
            else {return nil }
        
        guard let dName = decoder.decodeObjectForKey("name") as? String
            else {return nil }
        
        guard let dInterestRates = decoder.decodeObjectForKey("interestRates") as? Float
            else {return nil }
        
        guard let dInvestmentTerm = decoder.decodeObjectForKey("investmentTerm") as? NSTimeInterval
            else {return nil }
        
        guard let dImageName =
            decoder.decodeObjectForKey("imageName") as? String
            else {return nil}
        
        guard let dDescript =
            decoder.decodeObjectForKey("descript") as? String
            else {return nil}
        
        guard let dStartDate =
            decoder.decodeObjectForKey("startDate") as? NSDate
            else {return nil}
        
    
        self.init(pID: dID, pName: dName, pDescript:dDescript, pInterestRates:dInterestRates, pInvestmentTerm:dInvestmentTerm, pStartDate:dStartDate, pInvestedValue:0, pImageName: dImageName)
        self.currentValue = dCurrentValue
        self.startingValue = dInvestedValue
    }
    
    @objc func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.startingValue, forKey: "investedValue")
        coder.encodeObject(self.currentValue, forKey: "currentValue")
        coder.encodeObject(self.id, forKey: "LRI-ID")
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.interestRates, forKey: "interestRates")
        coder.encodeObject(self.investmentTerm, forKey: "investmentTerm")
        coder.encodeObject(self.imageName, forKey: "imageName")
        coder.encodeObject(self.descript, forKey: "descript")
        coder.encodeObject(self.startDate, forKey: "startDate")
    }
    
    func interestRatePerSecond()->Float{
        let interestRatePerHour = self.interestRates / 24
        let interestRatePerMinute = interestRatePerHour / 60
        var interestRatePerSecond = interestRatePerMinute / 60
       // interestRatePerSecond = interestRatePerSecond + 1
        return interestRatePerSecond
    }
    
    
    
}