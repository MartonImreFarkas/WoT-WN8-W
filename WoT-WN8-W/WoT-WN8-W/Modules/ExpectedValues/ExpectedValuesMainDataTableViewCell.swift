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
    
    func setupCell(vehicleData: VehicleDataStruct, wn8: Double, battles: Int) {
        
        tankIcon.kf_setImageWithURL( NSURL(string: vehicleData.image!)!)
        
        typeIcon.image = UIImage(named: vehicleData.typeImageName!)
        nationIcon.image = UIImage(named: vehicleData.nationFlagImageName!)
        
        tankNameLabel.text = vehicleData.short_name_i18n
        tierLabel.text = ator(vehicleData.level!)
        
        wn8ValueLabel.text = String(format: "%.02f", wn8)
        wn8ValueLabel.textColor = wn8Color(Int(wn8))
        
        battleCountLabel.text = "\(battles)"
    }
    
    
    
    func wn8Color(rating: Int) -> UIColor {
        if rating <  300 {
            return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
        if rating <  600 {
            return UIColor(red: 238.0/255, green: 48.0/255, blue: 48.0/255, alpha: 1.0)
        }
        if rating <  900 {
            return UIColor(red: 241.0/255, green: 122.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if rating < 1250 {
            return UIColor(red: 227.0/255, green: 183.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if rating < 1600 {
            return UIColor(red: 86.0/255, green: 150.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if rating < 1900 {
            return UIColor(red: 43.0/255, green: 119.0/255, blue: 34.0/255, alpha: 1.0)
        }
        if rating < 2350 {
            return UIColor(red: 0.0/255, green: 147.0/255, blue: 186.0/255, alpha: 1.0)
        }
        if rating < 2900 {
            return UIColor(red: 146.0/255, green: 86.0/255, blue: 161.0/255, alpha: 1.0)
        }
       
        return UIColor(red: 101.0/255, green: 45.0/255, blue: 120.0/255, alpha: 1.0)
        
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
