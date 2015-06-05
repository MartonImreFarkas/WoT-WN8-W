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
    
    var avg_damage_blocked : Double?
    var base_xp : Int?
    var battle_avg_xp : Int?
    var battles : Int?
    var capture_points : Int?
    var damage_dealt : Int?
    var damage_received : Int?
    var direct_hits_received : Int?
    var draws : Int?
    var dropped_capture_points : Int?
    var explosion_hits : Int?
    var explosion_hits_received : Int?
    var frags : Int?
    var hits : Int?;
    var hits_percents : Int?
    var losses : Int?
    var no_damage_direct_hits_received : Int?
    var piercings : Int?
    var piercings_received : Int?
    var shots : Int?
    var spotted : Int?
    var survived_battles : Int?
    var tanking_factor : Double?
    var wins : Int?
    var xp : Int?

}