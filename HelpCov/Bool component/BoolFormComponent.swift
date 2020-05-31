//
//  BoolFormComponent.swift
//  HelpCov
//
//  Created by Antoine Simon on 31/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

protocol BoolFormComponentProtocol {
    func setSegmented(titles: [String])
    func setLabel(title: String)
}

class BoolFormComponent: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

}

extension BoolFormComponent: BoolFormComponentProtocol {
    func setSegmented(titles: [String]) {
        for (index, title) in titles.enumerated() {
            segmentedControl.setTitle(title, forSegmentAt: index)
        }
    }
    
    func setLabel(title: String) {
        titleLabel.text = title
    }
    
    
}
