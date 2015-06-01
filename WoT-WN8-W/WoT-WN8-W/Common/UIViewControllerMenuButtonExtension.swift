//
//  UIViewControllerMenuButotnExtension.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 26/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @IBAction func onBurgerTap() {
        (tabBarController as! TabBarController).sidebar.showInViewController(self, animated: true)
    }
    
}