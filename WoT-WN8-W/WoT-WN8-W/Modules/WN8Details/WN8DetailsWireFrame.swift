//
//  WN8DetailsWireFrame.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 08/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit

protocol WN8DetailsRouter: class {
    
}

class WN8DetailsWireFrame: WN8DetailsRouter {
    private var view: WN8DetailsViewController
    private var presenter: protocol<WN8DetailsPresenterEventHandler>
    
    init() {
        self.view = WN8DetailsViewController.createView()
        self.presenter = WN8DetailsPresenter(view: view)
        self.presenter.wn8DetailsWireFrame = self
        self.view.presenter = presenter
    }
    
    func rootViewController() -> UIViewController {
        return self.view
    }
}