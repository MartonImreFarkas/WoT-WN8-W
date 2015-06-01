//
//  ProfileViewController.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 29/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileView : class {
    weak var presenter : protocol <ProfilePresenterEventHandler>? {get set}
    
    func setNameAndAccountId(name: String?, accountId: String?)
}

class ProfileViewController: UIViewController {

    weak var presenter: protocol<ProfilePresenterEventHandler>?
    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var accountIdLabel: UILabel!
    
    class func createView() -> ProfileViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        presenter?.setNameAndAccountId()
    }
}

extension ProfileViewController: ProfileView {

    func setNameAndAccountId(name: String?, accountId: String?) {
        nickNameLabel.text = name
        accountIdLabel.text = accountId
    }

}