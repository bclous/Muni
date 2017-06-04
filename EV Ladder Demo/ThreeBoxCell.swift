//
//  ThreeBoxCell.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 5/31/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

enum ThreeBoxCellStyle {
    case portfolioStyle
    case portfolioBreakdown
}

class ThreeBoxCell: UITableViewCell {

    @IBOutlet weak var boxView1: BoxView!
    @IBOutlet weak var boxView2: BoxView!
    @IBOutlet weak var boxView3: BoxView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func formatCell(type: ThreeBoxCellStyle) {
        switch type {
        case .portfolioStyle:
            boxView1.titleLabel.text = "STRUCTURE"
            boxView1.mainLabel.text = "3-12"
            boxView1.secondaryLabel.text = "Years"
            boxView2.titleLabel.text = "CREDIT"
            boxView2.mainLabel.text = "A-"
            boxView2.secondaryLabel.text = "Minimum"
            boxView3.titleLabel.text = "STATE"
            boxView3.mainLabel.text = "NY"
            boxView3.secondaryLabel.text = "Specific"
        case .portfolioBreakdown:
            boxView1.titleLabel.text = "DURATION"
            boxView1.mainLabel.text = "4.5"
            boxView1.secondaryLabel.text = "Years"
            boxView2.titleLabel.text = "PURCHASE YIELD"
            boxView2.mainLabel.text = "3.2%"
            boxView2.secondaryLabel.text = ""
            boxView3.titleLabel.text = "YTW"
            boxView3.mainLabel.text = "2.4%"
            boxView3.secondaryLabel.text = ""
            boxView2.formatBoxView(withLabel: false)
            boxView3.formatBoxView(withLabel: false)
            
        }
        
        //contentView.backgroundColor = UIColor.clear
    }
}
