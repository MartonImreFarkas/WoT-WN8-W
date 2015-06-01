//
//  ExpectedValuesDataStore.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

class ExpectedValuesDataStore {
    
    static let sharedInstance = ExpectedValuesDataStore()
    
    var expectedValuesData = Dictionary<String, String>()
    
    
    func loadUserLoginData() {
        var userLoginDataDictionary = NSUserDefaults.standardUserDefaults().valueForKey("expectedValuesData") as! Dictionary<String,String>
        
        for (key, value) in userLoginDataDictionary {
            expectedValuesData.updateValue(userLoginDataDictionary[key]!, forKey: key)
        }
    }
    
    func saveUserLoginData(dictionary : Dictionary<String,String>) {
        expectedValuesData = dictionary
        NSUserDefaults.standardUserDefaults().setValue(dictionary, forKey: "expectedValuesData")
    }
    
}