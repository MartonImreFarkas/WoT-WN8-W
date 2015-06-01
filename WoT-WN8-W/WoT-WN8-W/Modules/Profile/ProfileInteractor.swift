//
//  ProfileInteractor.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 29/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

let nickNameKey = "nickname"
let accountIdKey = "account_id"

class ProfileInteractor {
   
    func nickName() -> String? {
        UserDataStore.sharedInstance.loadUserLoginData()
        return UserDataStore.sharedInstance.loginData[nickNameKey]
    }
    func accountId() -> String? {
        return UserDataStore.sharedInstance.loginData[accountIdKey]
    }
}