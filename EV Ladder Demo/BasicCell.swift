//
//  BasicCell.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 5/31/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
