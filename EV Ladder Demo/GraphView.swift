//
//  GraphView.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 6/3/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class GraphView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var masterStackView: UIStackView!
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
    Bundle.main.loadNibNamed("GraphView", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    public func formatGraph(labels: [String], values: [CGFloat], height: CGFloat, spacing: CGFloat) {
        if labels.count == values.count {
            
            for view in masterStackView.arrangedSubviews {
                //masterStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
            
            masterStackView.spacing = spacing
            
            let maxHeight = height
            
            let maxValue = values.max()!
            var index = 0
            for label in labels {
                let bar = GraphViewSingleBarView()
                masterStackView.addArrangedSubview(bar)
                bar.formatBar(label: label, value: values[index] , maxValue: maxValue, maxHeight: height, animated: false)
                index += 1
            }
        }
        
    }

}
