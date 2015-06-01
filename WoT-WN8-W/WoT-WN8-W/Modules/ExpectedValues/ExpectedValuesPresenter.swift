//
//  ExpectedValuesPresenter.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import Foundation

protocol ExpectedValuesPresenterEventHandler: class {
    weak var expectedValuesWireFrame: protocol<ExpectedValuesRouter>? {get set}
    weak var expectedValuesView : protocol<ExpectedValuesView>? {get set}
    
    func downloadExpectedValues() -> [ExpectedValueStruct]
}

class ExpectedValuesPresenter : NSObject {
    weak var expectedValuesWireFrame: ExpectedValuesRouter?
    weak var expectedValuesView: ExpectedValuesView?
    let expectedValuesInteractor = ExpectedValuesInteractor()
    
    init(view: ExpectedValuesView) {
        super.init()
        self.expectedValuesView = view
    }
    
    
}

extension ExpectedValuesPresenter: ExpectedValuesPresenterEventHandler {
    
    func downloadExpectedValues() -> [ExpectedValueStruct] {
        return expectedValuesInteractor.getExpectedValuesSync()
    }
}

