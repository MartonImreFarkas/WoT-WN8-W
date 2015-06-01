//
//  LoginPresenter.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 26/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

protocol LoginPresenterEventHandler: class {
    weak var loginWireFrame: protocol<LoginRouter>? {get set}
    weak var loginView : protocol<LoginView>? {get set}
    
    func isLoginSuccessful(request: NSURLRequest) -> Bool
    func handleLoginLoading()
    func successfulLogin()
    
}

class LoginPresenter : NSObject {
    weak var loginWireFrame: LoginRouter?
    weak var loginView: LoginView?
    let loginInteractor = LoginInteractor()
    
    init(view: LoginView) {
        super.init()
        self.loginView = view
    }
    
    
}

extension LoginPresenter: LoginPresenterEventHandler {
    
    func isLoginSuccessful(request: NSURLRequest) -> Bool {
        return loginInteractor.isLoginSuccessful(request)
    }
    
    func handleLoginLoading() {
         loginView!.loadRequest(loginInteractor.assembleLoginRequest())
    }
    func successfulLogin() {
        loginView!.handleLoginSuccess(loginInteractor.loggedInMessage())
    }
}

