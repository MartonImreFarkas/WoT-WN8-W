//
//  ProfileWireFrame.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 29/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileRouter: class {
    
}

class ProfileWireFrame: ProfileRouter {
    private var view: ProfileViewController
    private var presenter: protocol<ProfilePresenterEventHandler>
    
    init() {
        self.view = ProfileViewController.createView()
        self.presenter = ProfilePresenter(view: view)
        self.presenter.profileWireFrame = self
        self.view.presenter = presenter
    }
    
    func rootViewController() -> UIViewController {
        return self.view
    }
}