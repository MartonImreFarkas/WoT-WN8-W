//
//  LoginViewController.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 26/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit

protocol LoginView : class {
    weak var presenter : protocol <LoginPresenterEventHandler>? {get set}
    
    func loadRequest(request: NSURLRequest)
    func handleLoginSuccess(successString: String)
}


class LoginViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView : UIWebView!
    
    weak var presenter: protocol<LoginPresenterEventHandler>?
    class func createView() -> LoginViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        webView.delegate = self
        presenter?.handleLoginLoading()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if presenter!.isLoginSuccessful(request) {
            presenter!.successfulLogin()
        }
        return true
    }
    
}

extension LoginViewController: LoginView {

    func loadRequest(request: NSURLRequest) {
        webView.delegate = self
        webView.loadRequest(request)
    }
    
    func handleLoginSuccess(successString: String) {
        webView.loadHTMLString(successString, baseURL: nil)
        var userDataStore = UserDataStore.sharedInstance
    }
}