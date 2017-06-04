//
//  BoxView.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 5/31/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class BoxView: UIView {

    @IBOutlet weak var mainLabelCenterYConstraint: NSLayoutConstraint!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("BoxView", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    func formatBoxView(withLabel: Bool) {
    
        mainLabelCenterYConstraint.constant = withLabel ? -13 : 0
        layoutIfNeeded()
        
    }
}
