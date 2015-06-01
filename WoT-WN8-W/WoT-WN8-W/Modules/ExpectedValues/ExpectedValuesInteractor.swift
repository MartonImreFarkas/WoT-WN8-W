//
//  ExpectedValuesInteractor.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation


// http://www.wnefficiency.net/exp/expected_tank_values_20.json

class ExpectedValuesInteractor {
    
    
    let baseUriKey = "http://www.wnefficiency.net/exp/expected_tank_values_"
    var versionKey = 20
    let postFixKey = ".json"

    
    var expectedValuesData: NSData?
    
    var expectedValuesArray = [ExpectedValueStruct]()
    
    func getExpectedValuesSync() -> [ExpectedValueStruct] {
        let urlString = "\(baseUriKey)\(versionKey)\(postFixKey)"
        
        let url = NSURL(string: urlString)
        expectedValuesData = NSData(contentsOfURL: url!)
        
        deserialize()
        
        return expectedValuesArray
    }
    
    func deserialize() {
        
        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(expectedValuesData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            if let items = json["data"] as? NSArray {
                for item in items {
                    // construct your model objects here
                    let dict =  item as! Dictionary<String,Double>
                    
                    var expectedValuesStruct = ExpectedValueStruct()
                    expectedValuesStruct.IDNum = Int(dict["IDNum"]!)
                    expectedValuesStruct.expFrag = dict["expFrag"]
                    expectedValuesStruct.expDamage = dict["expDamage"]
                    expectedValuesStruct.expSpot = dict["expSpot"]
                    expectedValuesStruct.expDef = dict["expDef"]
                    expectedValuesStruct.expWinRate = dict["expWinRate"]
                    expectedValuesArray.append(expectedValuesStruct)
                }
            }
        }
    }
    


}