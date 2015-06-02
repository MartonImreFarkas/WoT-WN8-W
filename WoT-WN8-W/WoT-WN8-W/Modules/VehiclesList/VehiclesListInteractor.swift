//
//  VehiclesListInteractor.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import Foundation


// http://www.wnefficiency.net/exp/expected_tank_values_20.json

class VehiclesListInteractor {
    
    //http://api.worldoftanks.eu/wot/encyclopedia/tanks/?application_id=demo
    let baseVehicleListUriKey = "http://api.worldoftanks.eu/wot/encyclopedia/tanks/?"   
    
    var vehicleListData: NSData?
    
    var vehicleDataArray = [VehicleDataStruct]()
    
    
    func getExpectedValuesSync() -> [VehicleDataStruct] {
        
        let url = NSURL(string: baseVehicleListUriKey + appIdKey + appIdString)
        vehicleListData = NSData(contentsOfURL: url!)
        
        deserialize()
        
        return vehicleDataArray
    }
    
    func deserialize() {
        
        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(vehicleListData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            if let items = json["data"] as? NSDictionary {
                for (key, value) in items {
                    // construct your model objects here
                    let dict =  value as! NSDictionary
                   
                    var vehicleDataStruct = VehicleDataStruct()
                    
                    vehicleDataStruct.nation_i18n = dict["nation_i18n"] as? String
                    vehicleDataStruct.name = dict["name"] as? String
                    vehicleDataStruct.level = dict["level"] as? Int
                    vehicleDataStruct.image = dict["image"] as? String
                    vehicleDataStruct.image_small = dict["image_small"] as? String // NSURL(string: (dict["image_small"] as! String))
                    vehicleDataStruct.nation = dict["nation"] as? String
                    vehicleDataStruct.is_premium = dict["is_premium"] as? Bool
                    vehicleDataStruct.type_i18n = dict["type_i18n"] as? String
                    vehicleDataStruct.contour_image = dict["contour_image"] as? String
                    vehicleDataStruct.short_name_i18n = dict["short_name_i18n"] as? String
                    vehicleDataStruct.name_i18n = dict["name_i18n"] as? String
                    vehicleDataStruct.type = dict["type"] as? String
                    vehicleDataStruct.tank_id = dict["tank_id"] as? Int
    
                    for nation in VehicleNationEnum.allValues{
                        if (nation.rawValue == vehicleDataStruct.nation) {
                            vehicleDataStruct.nationEnum = nation
                            break
                        }
                    }
                    
                    let vnins = VehicleNationImageNameStruct()
                    let vninD = vnins.allValuesDict()
                    
                    vehicleDataStruct.nationFlagImageName = vninD[vehicleDataStruct.nationEnum!]

                    vehicleDataArray.append(vehicleDataStruct)
                }
            }
        }
    }
}