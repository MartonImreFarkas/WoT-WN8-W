//
//  LoginPresenter.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 26/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

protocol LoginPresenterEventHandler : class {
    weak var loginWireFrame: protocol<LoginRouter>? {get set}
    weak var loginView : protocol<LoginView>? {get set}
    
}

class LoginPresenter: LoginPresenterEventHandler {
    weak var loginWireFrame: LoginRouter?
    weak var loginView: LoginView?
    let loginInteractor = LoginInteractor()
    
    init(view: LoginView) {
        self.loginView = view
    }
}