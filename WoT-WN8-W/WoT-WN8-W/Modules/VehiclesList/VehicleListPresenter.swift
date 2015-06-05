//
//  VehicleListPresenter.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 03/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

protocol VehicleListPresenterEventHandler: class {
    weak var vehicleListWireFrame: protocol<VehicleListRouter>? {get set}
    weak var vehicleListView : protocol<VehicleListView>? {get set}
    
    func downloadExpectedValues() -> [VehicleDataStruct]
}

class VehicleListPresenter : NSObject {
    weak var vehicleListWireFrame: VehicleListRouter?
    weak var vehicleListView: VehicleListView?
    let vehicleListInteractor = VehicleListInteractor()
    
    init(view: VehicleListView) {
        super.init()
        self.vehicleListView = view
    }
    
    
}

extension VehicleListPresenter: VehicleListPresenterEventHandler {
    
    func downloadExpectedValues() -> [VehicleDataStruct] {
        return vehicleListInteractor.getVehicleListSync()
    }
}

