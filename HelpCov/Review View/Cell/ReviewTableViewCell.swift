//
//  ReviewTableViewCell.swift
//  HelpCov
//
//  Created by Antoine Simon on 04/06/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var maskCustomerLabel: UILabel!
    @IBOutlet weak var maskEmployeLabel: UILabel!
    @IBOutlet weak var distancingLabel: UILabel!
    @IBOutlet weak var handGelLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var securityLabel: UILabel!
    @IBOutlet weak var CleanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
