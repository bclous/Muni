//
//  BondPositionInnerBox.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 6/4/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

enum LabelPosition {
    case left
    case right
    case middle
}

class BondPositionInnerBox: UIView {
    @IBOutlet var contentView: UIView!

    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("BondPositionInnerBox", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    public func formatBoxForPosition(_ position: LabelPosition) {
        switch position {
        case .left:
            bottomLabel.textAlignment = .left
            topLabel.textAlignment = .left
        case .right:
            bottomLabel.textAlignment = .right
            topLabel.textAlignment = .right
        case .middle:
            bottomLabel.textAlignment = .center
            topLabel.textAlignment = .center
        }
    }
    
    


}
