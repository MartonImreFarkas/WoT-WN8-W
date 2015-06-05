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

    
    func setupCell(name: String, playerValue: String, expectedValue: String) {
        nameLabel.text = name
        playerValueLabel.text = playerValue
        expectedValueLabel.text = expectedValue
    }
}
