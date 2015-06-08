//
//  TankPersonalData.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 05/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

class VehiclePersonalData {
    
    var vehicleData = VehicleDataStruct()
    var expectedValues = ExpectedValueStruct()
    
    var allBattleStat = VehicleBattleStat()
    
}


struct VehicleBattleStat {
    
    var avg_damage_blocked : Double = 0
    var base_xp : Int = 0
    var battle_avg_xp : Int = 0
    var battles : Int = 0
    var capture_points : Int = 0
    var damage_dealt : Int = 0
    var damage_received : Int = 0
    var direct_hits_received : Int = 0
    var draws : Int = 0
    var dropped_capture_points : Int = 0
    var explosion_hits : Int = 0
    var explosion_hits_received : Int = 0
    var frags : Int = 0
    var hits : Int = 0
    var hits_percents : Int = 0
    var losses : Int = 0
    var no_damage_direct_hits_received : Int = 0
    var piercings : Int = 0
    var piercings_received : Int = 0
    var shots : Int = 0
    var spotted : Int = 0
    var survived_battles : Int = 0
    var tanking_factor : Double = 0
    var wins : Int = 0
    var xp : Int = 0

}