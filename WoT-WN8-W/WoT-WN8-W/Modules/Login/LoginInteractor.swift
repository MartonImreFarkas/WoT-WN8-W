//
//  LoginInteractor.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 26/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

// https://api.worldoftanks.eu/wot/auth/login/?application_id=demo&redirect_uri=https%3A%2F%2Feu.wargaming.net%2Fdevelopers%2Fapi_explorer%2Fwot%2Fauth%2Flogin%2Fcomplete%2F

let baseLoginUriKey = "https://api.worldoftanks.eu/wot/auth/login/?"
let appIdKey = "application_id="
let appIdString = "41dd189694f08120ddc4d59d94d40e77"
let redirectUriKey = "&redirect_uri="
let redirectUri = "https://eu.wargaming.net/developers/api_explorer/wot/auth/login/complete/"

class LoginInteractor {
    
    func assembleLoginRequest() -> NSURLRequest {
        let url = NSURL(string: baseLoginUriKey + appIdKey + appIdString + redirectUriKey + redirectUri)
        let request = NSURLRequest(URL: url!)
        return request
    }
    
    func isLoginSuccessful(request: NSURLRequest) -> Bool {
        var urlString = request.URL?.absoluteString as String!
        
        if (urlString.hasPrefix(redirectUri) == true) {
            
            var urlStringArray = split(urlString) {$0 == "&"}
            if urlStringArray.count == 6 {
                var dictionary = Dictionary<String, String>()
                
                for index in 1...urlStringArray.count-1
                {
                    var statusArray = split(urlStringArray[index]) {$0 == "="}
                   
                    dictionary.updateValue(statusArray[1], forKey: statusArray[0])
                    
              
                }
                
                if dictionary["status"] == "ok" {
                    UserDataStore.sharedInstance.saveUserLoginData(dictionary)

                    return true
                }
            }
        }
        return false
    }
    
    func loggedInMessage() -> String {
        return "<br /><h2>Logged in succesfully!</h2><br /> You will be redirected shortly."
    }
}