He//
//  ReviewHeaderTableViewCell.swift
//  HelpCov
//
//  Created by Antoine Simon on 04/06/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

class ReviewHeaderTableViewCell: UIView {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    func setTitle(_ text: String) {
        titleLabel.text = text
    }
    
    func setRating(_ text: String) {
        ratingLabel.text = text
    }
}
