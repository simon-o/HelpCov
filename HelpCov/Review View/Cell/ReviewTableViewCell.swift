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
    
    func setQuality(_ text: NSAttributedString) {
        qualityLabel.attributedText = text
    }
    func setMaskCustomer(_ text: NSAttributedString) {
        maskCustomerLabel.attributedText = text
    }
    func setMaskEmploye(_ text: NSAttributedString) {
        maskEmployeLabel.attributedText = text
    }
    func setDistancing(_ text: NSAttributedString) {
        distancingLabel.attributedText = text
    }
    func setHandGel(_ text: NSAttributedString) {
        handGelLabel.attributedText = text
    }
    func setPayment(_ text: NSAttributedString) {
        paymentLabel.attributedText = text
    }
    func setSecurity(_ text: NSAttributedString) {
        securityLabel.attributedText = text
    }
    func setClean(_ text: NSAttributedString) {
        CleanLabel.attributedText = text
    }
}
