//
//  VehicleListWireFrame.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 03/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit


protocol VehicleListRouter: class {
    
}

class VehicleListWireFrame: VehicleListRouter {
    private var view: VehicleListViewController
    private var presenter: protocol<VehicleListPresenterEventHandler>
    
    init() {
        self.view = VehicleListViewController.createView()
        self.presenter = VehicleListPresenter(view: view)
        self.presenter.vehicleListWireFrame = self
        self.view.presenter = presenter
    }
    
    func rootViewController() -> UIViewController {
        return self.view
    }
}