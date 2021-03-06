//
//  ExpectedValuesNotLoggedInTableViewCell.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 03/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import UIKit
import Kingfisher

class ExpectedValuesNotLoggedInTableViewCell: UITableViewCell {

    @IBOutlet weak var tankIcon: UIImageView!
    @IBOutlet weak var nationIcon: UIImageView!
    @IBOutlet weak var typeIcon: UIImageView!
    
    @IBOutlet weak var tierLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet weak var fragLabel: UILabel!
    @IBOutlet weak var spotLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var winRateLabel: UILabel!
    
    
    private var task : RetrieveImageTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        task?.cancel()
        
        nameLabel.text = nil
        tierLabel.text = nil
        nationIcon.image = nil
        typeIcon.image = nil
        tankIcon.image = nil
        
        damageLabel.text = nil
        fragLabel.text = nil
        spotLabel.text = nil
        defLabel.text = nil
        winRateLabel.text = nil
        
    }
    
    func setupCell(vehicleData : VehicleDataStruct, expectedValues : ExpectedValueStruct) {
        
        nameLabel.text = vehicleData.short_name_i18n
        if vehicleData.is_premium! {
            nameLabel.textColor = UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1.0)
        }
        else {
            nameLabel.textColor = UIColor.blackColor()
        }
        
        tierLabel.text = ator(vehicleData.level!)
        
        nationIcon.image = UIImage(named: vehicleData.nationFlagImageName!)

        typeIcon.image = UIImage(named: vehicleData.typeImageName!)
  
        task = tankIcon.kf_setImageWithURL(NSURL(string: vehicleData.image!)!)
        
        damageLabel.text = "\(expectedValues.expDamage!)"
        fragLabel.text = "\(expectedValues.expFrag!)"
        spotLabel.text = "\(expectedValues.expSpot!)"
        defLabel.text = "\(expectedValues.expDef!)"
        winRateLabel.text = "\(expectedValues.expWinRate!)%"
        
        
        
        backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
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
