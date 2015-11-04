//
//  EnterprisesDAO.swift
//  P.I.G
//
//  Created by Henrique do Prado Linhares on 04/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class EnterprisesDAO{

    
    static let sharedInstance = EnterprisesDAO()
    
    func saveEnterprises(){
        print("saving enterprises")
        let enterprisesData : NSData = NSKeyedArchiver.archivedDataWithRootObject(AppData.sharedInstance.enterprises)
        PListManager.sharedInstance.writePlist("Database", key: "Enterprises", data: enterprisesData)
    }
    
    
    func readEnterprises(){
        print("reading enterprises")
        let read = PListManager.sharedInstance.readPlist("Database", key: "Enterprises")
        let data = read as! NSData
        AppData.sharedInstance.enterprises = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Enterprise]
    }

    
}