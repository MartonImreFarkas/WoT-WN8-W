//
//  ProfilePresenter.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 29/05/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

protocol ProfilePresenterEventHandler : class {
    weak var profileWireFrame: protocol<ProfileRouter>? {get set}
    weak var profileView : protocol<ProfileView>? {get set}
    
    func setNameAndAccountId()

}

class ProfilePresenter {
    weak var profileWireFrame: ProfileRouter?
    weak var profileView: ProfileView?
    let profileInteractor = ProfileInteractor()
    
    init(view: ProfileView) {
        self.profileView = view
    }
}

extension ProfilePresenter: ProfilePresenterEventHandler {
    
    func setNameAndAccountId() {
        let nick = profileInteractor.nickName()
        let accId = profileInteractor.accountId()
        profileView?.setNameAndAccountId(nick, accountId: accId)
    }


}
