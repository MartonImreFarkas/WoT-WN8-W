//
//  VehicleDataStruct.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

struct VehicleDataStruct {

    var nation_i18n: String?
    var name : String?
    var level : Int?
    var image : String?
    var image_small : String?
    var nation : String?
    var is_premium : Bool?
    var type_i18n : String?
    var contour_image : String?
    var short_name_i18n : String?
    var name_i18n : String?
    var type : String?
    var tank_id : Int?
    var nationEnum : VehicleNationEnum?
    var nationFlagImageName : String?
    
    init() {
        
    }
}



enum VehicleNationEnum : String {
    case Ussr = "ussr", Germany = "germany", Usa = "usa", France = "france", Uk = "uk", China = "china", Japan = "japan"
    
    static let allValues = [Ussr, Germany, Usa, France, Uk, China, Japan]
}

enum VehicleNationImageName : String {
    case Ussr = "Graffiti_stickers_ussr_S", Germany = "Graffiti_stickers_germany_S", Usa = "Graffiti_stickers_usa_A", France = "Graffiti_stickers_france_A", Uk = "Graffiti_stickers_uk", China = "Graffiti_stickers_china", Japan = "Graffiti_stickers_japan"
    
    static let allValues = [Ussr, Germany, Usa, France, Uk, China, Japan]
}

struct VehicleNationImageNameStruct {
    
    var Ussr = "Graffiti_stickers_ussr_S"
    var Germany = "Graffiti_stickers_germany_S"
    var Usa = "Graffiti_stickers_usa_A"
    var France = "Graffiti_stickers_france_A"
    var Uk = "Graffiti_stickers_uk"
    var China = "Graffiti_stickers_china"
    var Japan = "Graffiti_stickers_japan"
    
    func allValues () -> [String] {
        return [Ussr, Germany, Usa, France, Uk, China, Japan]
    }
    
    func allValuesDict () -> [VehicleNationEnum : String] {
        
        return [VehicleNationEnum.Ussr : Ussr, VehicleNationEnum.Germany : Germany, VehicleNationEnum.Usa : Usa, VehicleNationEnum.France : France, VehicleNationEnum.Uk : Uk, VehicleNationEnum.China : China, VehicleNationEnum.Japan : Japan]
    }
}


/*
for category in ProductCategory.allValues{
    //Do something
}
*/