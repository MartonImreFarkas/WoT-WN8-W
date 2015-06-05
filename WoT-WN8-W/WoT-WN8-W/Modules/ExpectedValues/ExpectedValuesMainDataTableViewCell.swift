//
//  ExpectedValuesMainDataTableViewCell.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 04/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import UIKit
import Kingfisher

class ExpectedValuesMainDataTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tankIcon: UIImageView!
    @IBOutlet weak var typeIcon: UIImageView!
    @IBOutlet weak var nationIcon: UIImageView!
    
    
    @IBOutlet weak var tankNameLabel: UILabel!
    @IBOutlet weak var tierLabel: UILabel!
    
    @IBOutlet weak var wn8ValueLabel: UILabel!
    @IBOutlet weak var battleCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(vehicleData: VehicleDataStruct, wn8: Int, battles: Int) {
        
        tankIcon.kf_setImageWithURL( NSURL(string: vehicleData.image!)!)
        
        typeIcon.image = UIImage(named: vehicleData.typeImageName!)
        nationIcon.image = UIImage(named: vehicleData.nationFlagImageName!)
        
        tankNameLabel.text = vehicleData.short_name_i18n
        tierLabel.text = ator(vehicleData.level!)
        
        wn8ValueLabel.text = "\(wn8)"
        battleCountLabel.text = "\(battles)"
    }
    
    func ator(var n: Int) -> String {
        
        var result = ""
        
        for (value, letter) in
            [( 1000,    "M"),
                (  900,   "CM"),
                (  500,    "D"),
                (  400,   "CD"),
                (  100,    "C"),
                (   90,   "XC"),
                (   50,    "L"),
                (   40,   "XL"),
                (   10,    "X"),
                (    9,   "IX"),
                (    5,    "V"),
                (    4,   "IV"),
                (    1,    "I")]
        {
            while n >= value {
                result += letter
                n   -= value
            }
        }
        return result
    }

}
