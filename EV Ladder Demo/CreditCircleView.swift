//
//  CreditCircleView.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 5/31/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

enum BondRating {
    case AAA
    case AA
    case A
    case BBB
    case belowBBB
}

class CreditCircleView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var circleDiameter: NSLayoutConstraint!
    
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CreditCircleView", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
        
    }
    
    func formatCircleView(rating: BondRating, frameWidth: CGFloat, cellHeight: CGFloat, percentage: CGFloat, maxPercentage: CGFloat) {
    
        let maxCircleWidth : CGFloat = (frameWidth / 5.0) - 10
        let maxCircleHeight : CGFloat = cellHeight - 70
        let maxCircleDiameter = maxCircleWidth < maxCircleHeight ? maxCircleWidth : maxCircleHeight
        
        let maxCircleArea = (maxCircleDiameter / 2.0) * (maxCircleDiameter / 2.0) * 3.14159
        
        
        let ratio : CGFloat = percentage / maxPercentage
        let finalArea = ratio * maxCircleArea
        let finalRadius = sqrt(finalArea/3.14159)
        let finalDiameter = finalRadius * 2
        
        print("max width: \(maxCircleWidth), max height: \(maxCircleHeight), ratio: \(ratio), final diameter: \(finalDiameter)")
        
        circleDiameter.constant = finalDiameter
        
        circleView.layer.cornerRadius = finalDiameter / 2
        self.layoutIfNeeded()
        
        circleView.backgroundColor = rating == .belowBBB ? UIColor.red : UIColor.green
        
        switch rating {
        case .AAA:
            ratingLabel.text = "AAA"
            circleView.alpha = 0.9
        case .AA:
            ratingLabel.text = "AA"
            circleView.alpha = 0.7
        case .A:
            ratingLabel.text = "A"
            circleView.alpha = 0.5
        case .BBB:
            ratingLabel.text = "BBB"
            circleView.alpha = 0.3
        case .belowBBB:
            ratingLabel.text = "<BBB"
            circleView.alpha = 0.5
        }
        
        
        let percentText = String(format:"%.0f", percentage * 100) + "%"
        percentLabel.text = percentText
        
    }

}
