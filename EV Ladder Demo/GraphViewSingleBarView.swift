//
//  GraphViewSingleBarView.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 6/3/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class GraphViewSingleBarView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var graphBar: UIView!
    @IBOutlet weak var graphBarHeight: NSLayoutConstraint!
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("GraphViewSingleBarView", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    public func formatBar(label: String, value: CGFloat, maxValue: CGFloat, maxHeight: CGFloat, animated: Bool) {
        bottomLabel.text = label
        topLabel.text = String(format:"%.0f", value * 100) + "%"
        let height : CGFloat = value / maxValue * (maxHeight - 33)
        adjustBarHeightTo(height: height, animated: animated)
    }
    
    private func adjustBarHeightTo(height: CGFloat, animated: Bool) {
        graphBarHeight.constant = height
        let duration = animated ? 0.5 : 0
        UIView.animate(withDuration: duration) { 
            self.layoutIfNeeded()
        }
    }


}
