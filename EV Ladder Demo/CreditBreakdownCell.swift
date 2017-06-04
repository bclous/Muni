//
//  CreditBreakdownCell.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 5/31/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class CreditBreakdownCell: UITableViewCell {

    @IBOutlet weak var belowBBBView: CreditCircleView!
    @IBOutlet weak var BBBView: CreditCircleView!
    @IBOutlet weak var AView: CreditCircleView!
    @IBOutlet weak var AAView: CreditCircleView!
    @IBOutlet weak var AAAView: CreditCircleView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func formatCell(rowHeight: CGFloat, frameWidth: CGFloat, AAA: CGFloat, AA: CGFloat, A: CGFloat, BBB: CGFloat, belowBBB: CGFloat) {
        
        let maximum = max(AAA, AA, A, BBB, belowBBB)
  
        AAAView.formatCircleView(rating: .AAA, frameWidth: frameWidth, cellHeight: rowHeight, percentage: AAA, maxPercentage: maximum)
        AAView.formatCircleView(rating: .AA, frameWidth: frameWidth, cellHeight: rowHeight, percentage: AA, maxPercentage: maximum)
        AView.formatCircleView(rating: .A, frameWidth: frameWidth, cellHeight: rowHeight, percentage: A, maxPercentage: maximum)
        BBBView.formatCircleView(rating: .BBB, frameWidth: frameWidth, cellHeight: rowHeight, percentage: BBB, maxPercentage: maximum)
        belowBBBView.formatCircleView(rating: .belowBBB, frameWidth: frameWidth, cellHeight: rowHeight, percentage: belowBBB, maxPercentage: maximum)
        
    }

}
