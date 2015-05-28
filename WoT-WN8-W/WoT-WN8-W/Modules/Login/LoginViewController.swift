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
}


class LoginViewController: UIViewController, UIWebViewDelegate, LoginView {
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
}