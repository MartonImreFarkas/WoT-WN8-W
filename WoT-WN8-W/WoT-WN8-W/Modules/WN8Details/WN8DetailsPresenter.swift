//
//  WN8DetailsPresenter.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 08/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

protocol WN8DetailsPresenterEventHandler: class {
    weak var wn8DetailsWireFrame: protocol<WN8DetailsRouter>? {get set}
    weak var wn8DetailsView : protocol<WN8DetailsView>? {get set}
 
}

class WN8DetailsPresenter {
    weak var wn8DetailsWireFrame: WN8DetailsRouter?
    weak var wn8DetailsView: WN8DetailsView?
    let wn8DetailsInteractor = WN8DetailsInteractor()
    
    init(view: WN8DetailsView) {
        self.wn8DetailsView = view
    }
    
    
}

extension WN8DetailsPresenter: WN8DetailsPresenterEventHandler {
    
 }
