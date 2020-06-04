//
//  ReviewTableViewCell.swift
//  HelpCov
//
//  Created by Antoine Simon on 04/06/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet private weak var qualityLabel: UILabel!
    @IBOutlet private weak var maskCustomerLabel: UILabel!
    @IBOutlet private weak var maskEmployeLabel: UILabel!
    @IBOutlet private weak var distancingLabel: UILabel!
    @IBOutlet private weak var handGelLabel: UILabel!
    @IBOutlet private weak var paymentLabel: UILabel!
    @IBOutlet private weak var securityLabel: UILabel!
    @IBOutlet private weak var CleanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setQuality(_ text: String) {
        qualityLabel.text = text
    }
    func setMaskCustomer(_ text: String) {
        maskCustomerLabel.text = text
    }
    func setMaskEmploye(_ text: String) {
        maskEmployeLabel.text = text
    }
    func setDistancing(_ text: String) {
        distancingLabel.text = text
    }
    func setHandGel(_ text: String) {
        handGelLabel.text = text
    }
    func setPayment(_ text: String) {
        paymentLabel.text = text
    }
    func setSecurity(_ text: String) {
        securityLabel.text = text
    }
    func setClean(_ text: String) {
        CleanLabel.text = text
    }
}
