//
//  ExpectedValuesWireFrame.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit


protocol ExpectedValuesRouter: class {
    
}

class ExpectedValuesWireFrame: ExpectedValuesRouter {
    private var view: ExpectedValuesViewController
    private var presenter: protocol<ExpectedValuesPresenterEventHandler>
    
    init() {
        self.view = ExpectedValuesViewController.createView()
       self.presenter = ExpectedValuesPresenter(view: view)
        self.presenter.expectedValuesWireFrame = self
        self.view.presenter = presenter
     }
    
    func rootViewController() -> UIViewController {
        return self.view
    }
}