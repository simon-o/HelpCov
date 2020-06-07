//
//  ReviewViewModel.swift
//  HelpCov
//
//  Created by Antoine Simon on 04/06/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

protocol ReviewViewModelProtocol {
    func configure(cell: ReviewTableViewCell, review: MapPoint)
    func configure(header: ReviewHeaderTableViewCell, infos: ListPoint)
}

final class ReviewViewModel: NSObject {
    private func applyMain(text: String, second: String, bool: Bool?) -> NSAttributedString {
        let formattext = text + ":\n"
        let myAttributeMain = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        let partOne = NSAttributedString(string: formattext, attributes: myAttributeMain)
        
        var myAttributeSecond = [NSAttributedString.Key.foregroundColor: bool == true ? UIColor.green : UIColor.red]
        if bool == nil { myAttributeSecond = [NSAttributedString.Key.foregroundColor: UIColor.black] }
        let partTwo = NSAttributedString(string: second, attributes: myAttributeSecond)
        
        let combination = NSMutableAttributedString()
        combination.append(partOne)
        combination.append(partTwo)
        
        return combination
    }
}

extension ReviewViewModel: ReviewViewModelProtocol {
    func configure(header: ReviewHeaderTableViewCell, infos: ListPoint) {
        header.setRating("\("rating_label".localizedString): \(String(infos.rating))/5")
        header.setTitle(infos.array.first?.title ?? "")
    }
    
    func configure(cell: ReviewTableViewCell, review: MapPoint) {
        
        cell.setQuality(applyMain(text: "quality_label".localizedString, second: (String(review.quality) + "/5"), bool: nil))
        cell.setMaskCustomer(applyMain(text: "mask_customer_label".localizedString, second: review.maskCustomer.convertString(), bool: review.maskCustomer))
        cell.setMaskEmploye(applyMain(text: "mask_employe_label".localizedString, second: review.maskEmploye.convertString(), bool: review.maskEmploye))
        cell.setDistancing(applyMain(text: "distancing_label".localizedString, second: review.distancing.convertString(), bool: review.distancing))
        cell.setHandGel(applyMain(text: "hand_gel_label".localizedString, second: review.handgel.convertString(), bool: review.handgel))
        cell.setPayment(applyMain(text: "payment_label".localizedString, second: review.payment.convertString(), bool: review.payment))
        cell.setSecurity(applyMain(text: "security_label".localizedString, second: review.security.convertString(), bool: review.security))
        cell.setClean(applyMain(text: "clean_label".localizedString, second: review.clean.convertString(), bool: review.clean))
    }
}
