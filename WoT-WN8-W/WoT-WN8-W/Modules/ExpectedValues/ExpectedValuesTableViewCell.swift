//
//  ExpectedValuesTableViewCell.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 01/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import UIKit

class ExpectedValuesTableViewCell: UITableViewCell {
   
    @IBOutlet weak var tankImageView: UIImageView!
    @IBOutlet weak var tankNameLabel: UILabel!
    
    @IBOutlet weak var tankTierLabel: UILabel!
    @IBOutlet weak var tankNationFlag: UIImageView!
    
    @IBOutlet weak var tankTypeLabel: UILabel!
    
    @IBOutlet weak var expectedDamageValueLabel: UILabel!
    
}
