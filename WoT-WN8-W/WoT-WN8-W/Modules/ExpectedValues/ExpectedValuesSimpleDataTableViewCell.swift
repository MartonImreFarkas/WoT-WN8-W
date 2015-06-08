//
//  ExpectedValuesSimpleDataTableViewCell.swift
//  WoT-WN8-W
//
//  Created by Farkas Marton Imre on 04/06/15.
//  Copyright (c) 2015 Farkas Marton Imre. All rights reserved.
//

import UIKit

class ExpectedValuesSimpleDataTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playerValueLabel: UILabel!
    @IBOutlet weak var expectedValueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupHeaderCell(playerName: String) {
        nameLabel.text = ""
        playerValueLabel.text = playerName
        expectedValueLabel.text = "Expected"
    }
    
    func setupCell(name: String, playerValue: Double, expectedValue: Double, hasBattles : Bool) {
        nameLabel.text = name
        playerValueLabel.text = String(format: "%.02f", playerValue)
        
        if playerValue != expectedValue && hasBattles {
            playerValueLabel.textColor = playerValue < expectedValue ? UIColor.redColor() : UIColor.greenColor()
        }
        
        expectedValueLabel.text = "\(expectedValue)"
    }
}
