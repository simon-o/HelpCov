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
    
//    init() {
//        super.init()
//    }
}

extension ReviewViewModel: ReviewViewModelProtocol {
    func configure(header: ReviewHeaderTableViewCell, infos: ListPoint) {
        header.setRating(String(infos.rating))
        header.setTitle(infos.array.first?.title ?? "")
    }
    
    func configure(cell: ReviewTableViewCell, review: MapPoint) {
        cell.setQuality("\("quality_label".localizedString): \(String(review.quality))/5")
        cell.setMaskCustomer("\("mask_customer_label".localizedString):\n\(review.maskCustomer.convertString())")
        cell.setMaskEmploye("\("mask_employe_label".localizedString):\n\(review.maskEmploye.convertString())")
        cell.setDistancing("\("distancing_label".localizedString):\n\(review.distancing.convertString())")
        cell.setHandGel("\("hand_gel_label".localizedString):\n\(review.handgel.convertString())")
        cell.setPayment("\("payment_label".localizedString):\n\(review.payment.convertString())")
        cell.setSecurity("\("security_label".localizedString):\n\(review.security.convertString())")
        cell.setClean("\("clean_label".localizedString):\n\(review.clean.convertString())")
    }
}
