//
//  LoginWireFrame.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 26/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit


protocol LoginRouter: class {

}

class LoginWireFrame: LoginRouter {
    private var view: LoginViewController
    private var presenter: LoginPresenterEventHandler
    
    init() {
        self.view = LoginViewController.createView()
        self.presenter = LoginPresenter(view: view)
        self.presenter.loginWireFrame = self
        self.view.presenter = presenter
    }
    
    func rootViewController() -> UIViewController {
        return self.view
    }
}