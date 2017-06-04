//
//  BondPositionCell.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 6/1/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class BondPositionCell: UITableViewCell {

    @IBOutlet weak var parLabel: UILabel!
    @IBOutlet weak var issuerLabel: UILabel!
    @IBOutlet weak var cusipLabel: UILabel!
    @IBOutlet weak var stateBox: BondPositionInnerBox!
    @IBOutlet weak var couponBox: BondPositionInnerBox!
    @IBOutlet weak var maturityBox: BondPositionInnerBox!
    @IBOutlet weak var callBox: BondPositionInnerBox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func formatCell() {
        parLabel.text = "1500"
        cusipLabel.text = "ATE675R4"
        issuerLabel.text = "Ithaca School Disctrict GO"
        stateBox.formatBoxForPosition(.left)
        couponBox.formatBoxForPosition(.middle)
        maturityBox.formatBoxForPosition(.middle)
        callBox.formatBoxForPosition(.right)
        stateBox.topLabel.text = "STATE"
        stateBox.bottomLabel.text = "NY"
        couponBox.topLabel.text = "CPN"
        couponBox.bottomLabel.text = "5.25"
        maturityBox.topLabel.text = "MATURITY"
        maturityBox.bottomLabel.text = "04/04/2024"
        callBox.topLabel.text = "CALL"
        callBox.bottomLabel.text = "-"
    
    }

}
