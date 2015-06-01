//
//  UserDataStore.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 29/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

class UserDataStore {

    static let sharedInstance = UserDataStore()

    var loginData = Dictionary<String, String>()
 
    
    func loadUserLoginData() {
        var userLoginDataDictionary = NSUserDefaults.standardUserDefaults().valueForKey("userLoginData") as! Dictionary<String,String>
      
        for (key, value) in userLoginDataDictionary {
            loginData.updateValue(userLoginDataDictionary[key]!, forKey: key)
        }
    }

    func saveUserLoginData(dictionary : Dictionary<String,String>) {
        loginData = dictionary
        NSUserDefaults.standardUserDefaults().setValue(dictionary, forKey: "userLoginData")
    }

}