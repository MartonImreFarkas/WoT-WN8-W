//
//  TankPersonalDataInteractor.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 04/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

let accessTokenString = "&access_token="
let tankIdString = "&tank_id="


class VehiclePersonalDataInteractor {
    
    //http://api.worldoftanks.eu/wot/tanks/stats/?application_id=41dd189694f08120ddc4d59d94d40e77&access_token=553127a1d1d185fe827cdd1dc20e4fde9ef3471e&account_id=504642365&tank_id=4929
    let baseVehicleListUriKey = "http://api.worldoftanks.eu/wot/tanks/stats/?"
    
    
    var vehiclePersonalData = VehiclePersonalData()
    
    
    func getVehicledataSync(tankId : Int) -> VehiclePersonalData {
        
        
        UserDataStore.sharedInstance.loadUserLoginData()
        if let accessToken = UserDataStore.sharedInstance.loginData[accessTokenKey]
        {
            let acccountIdValue = UserDataStore.sharedInstance.loginData[accountIdKey]! as String
            let url = NSURL(string: baseVehicleListUriKey + appIdKey + appIdString + accessTokenString +  accessToken + "&" + accountIdKey + "=" + acccountIdValue + tankIdString + "\(tankId)")
            
            if let vehiclePersonalData = NSData(contentsOfURL: url!)
            {
                deserialize(vehiclePersonalData)
            }
        
        }
        return vehiclePersonalData
    }
    
    func deserialize(vehicleData: NSData) {
        
        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(vehicleData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            if let items = json["data"] as? NSDictionary {
                
                let vninD = VehicleNationImageNameStruct().allValuesDict()
                let vtinD = VehicleTypeImageName().allValuesDict()
                
                for (accountIdKey, accountData) in items {
                    if let dict =  accountData[0] as? NSDictionary {
                    
                    var vehicleAllBattleStat = VehicleBattleStat()
                    
                    let allBattleDict = dict["all"] as! NSDictionary
                    
                    vehicleAllBattleStat.avg_damage_blocked = allBattleDict["avg_damage_blocked"] as! Double
                    vehicleAllBattleStat.base_xp = allBattleDict["base_xp"] as! Int
                    vehicleAllBattleStat.battle_avg_xp = allBattleDict["battle_avg_xp"] as! Int
                    vehicleAllBattleStat.battles = allBattleDict["battles"] as! Int
                    vehicleAllBattleStat.capture_points = allBattleDict["capture_points"] as! Int
                    vehicleAllBattleStat.damage_dealt = allBattleDict["damage_dealt"] as! Int
                    vehicleAllBattleStat.damage_received = allBattleDict["damage_received"] as! Int
                    vehicleAllBattleStat.direct_hits_received = allBattleDict["direct_hits_received"] as! Int
                    vehicleAllBattleStat.draws = allBattleDict["draws"] as! Int
                    vehicleAllBattleStat.dropped_capture_points = allBattleDict["dropped_capture_points"] as! Int
                    vehicleAllBattleStat.explosion_hits = allBattleDict["explosion_hits"] as! Int
                    vehicleAllBattleStat.explosion_hits_received = allBattleDict["explosion_hits_received"] as! Int
                    vehicleAllBattleStat.frags = allBattleDict["frags"] as! Int
                    vehicleAllBattleStat.hits = allBattleDict["hits"] as! Int
                    vehicleAllBattleStat.hits_percents = allBattleDict["hits_percents"] as! Int
                    vehicleAllBattleStat.losses = allBattleDict["losses"] as! Int
                    vehicleAllBattleStat.no_damage_direct_hits_received = allBattleDict["no_damage_direct_hits_received"] as! Int
                    vehicleAllBattleStat.piercings = allBattleDict["piercings"] as! Int
                    vehicleAllBattleStat.piercings_received = allBattleDict["piercings_received"] as! Int
                    vehicleAllBattleStat.shots = allBattleDict["shots"] as! Int
                    vehicleAllBattleStat.spotted = allBattleDict["spotted"] as! Int
                    vehicleAllBattleStat.survived_battles = allBattleDict["survived_battles"] as! Int
                    vehicleAllBattleStat.tanking_factor = allBattleDict["tanking_factor"] as! Double
                    vehicleAllBattleStat.wins = allBattleDict["wins"] as! Int
                    vehicleAllBattleStat.xp = allBattleDict["xp"] as! Int
                    
                    vehiclePersonalData.allBattleStat = vehicleAllBattleStat
                    }

                }
            }
        }
    }
}