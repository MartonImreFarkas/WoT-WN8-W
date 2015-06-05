//
//  ExpectedValueStruct.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

struct ExpectedValueStruct {
    var IDNum:Int?
    var expFrag:Double?
    var expDamage:Double?
    var expSpot:Double?
    var expDef:Double?
    var expWinRate:Double?

    init() {
        IDNum = 0
        expFrag = 0
        expDamage = 0
        expSpot = 0
        expDef = 0
        expWinRate = 0
    }
}