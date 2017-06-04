//
//  MaturityGraphCell.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 6/1/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class MaturityGraphCell: UITableViewCell {

    @IBOutlet weak var graphView: GraphView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func formatGraphCell(labels: [String], values: [CGFloat], cellHeight: CGFloat, spacing: CGFloat) {
        graphView.formatGraph(labels: labels, values: values, height: cellHeight - 24, spacing: spacing)
    }

}
