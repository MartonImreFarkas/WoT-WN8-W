//
//  TankMinimalDescriptionTableViewCell.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 02/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import UIKit
import Kingfisher

class TankMinimalDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var tankImageView: UIImageView!
    @IBOutlet weak var tankNameLabel: UILabel!
    
    @IBOutlet weak var tankNationImageView: UIImageView!
    
    @IBOutlet weak var tankTypeLabel: UILabel!
    @IBOutlet weak var tankTierLabel: UILabel!
    
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
        tankImageView.image = nil
    }
    
    func setupCell(vehicleData : VehicleDataStruct) {
        
        tankNameLabel.text = vehicleData.short_name_i18n
        if vehicleData.is_premium! {
            tankNameLabel.textColor = UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1.0)
        }
        else {
            tankNameLabel.textColor = UIColor.blackColor()
        }
        
        tankTierLabel.text = ator(vehicleData.level!)
        tankTypeLabel.text = vehicleData.type_i18n
        
        tankNationImageView.image = UIImage(named: vehicleData.nationFlagImageName!)
        
        var vehicleImage = vehicleData.contour_image!
        
        
        task = tankImageView.kf_setImageWithURL(NSURL(string: vehicleImage)!)

        
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
