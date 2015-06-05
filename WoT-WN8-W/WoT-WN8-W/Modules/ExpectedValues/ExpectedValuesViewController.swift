//
//  ExpectedValuesViewController.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 03/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit

protocol ExpectedValuesView : class {
    weak var presenter : protocol <ExpectedValuesPresenterEventHandler>? {get set}
  }

class ExpectedValuesViewController: UIViewController {
    
    weak var presenter: protocol<ExpectedValuesPresenterEventHandler>?
    
    class func createView() -> ExpectedValuesViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewControllerWithIdentifier("ExpectedValuesViewController") as! ExpectedValuesViewController
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
    }
}

extension ExpectedValuesViewController: ExpectedValuesView {

    
}