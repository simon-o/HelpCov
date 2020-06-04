//
//  AddReviewViewModel.swift
//  HelpCov
//
//  Created by Antoine Simon on 29/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces

protocol AddReviewViewModelProtocol {
    func donePressed()
    
    func fetchLocation(coordinate: GMSPlace)
    func getMaskCustomer() -> String
    func getMaskEmploye() -> String
    func getDistance() -> String
    func getHandGel() -> String
    func getPayment() -> String
    func getSecurity() -> String
    func getClean() -> String
    func getQuality() -> String
    func getSearchButton() -> String
    func getNavTitle() -> String
    
    var updateName: ((String) -> Void)? {get set}
    
    var getMaskCustomerValue: (() -> Bool)? {get set}
    var getMaskEmployeValue: (() -> Bool)? {get set}
    var getDistancingValue: (() -> Bool)? {get set}
    var getHandGelValue: (() -> Bool)? {get set}
    var getPaymentValue: (() -> Bool)? {get set}
    var getSecurityValue: (() -> Bool)? {get set}
    var getCleanValue: (() -> Bool)? {get set}
    var getQualityValue: (() -> Int)? {get set}
    var popToPreviousView: (() -> Void)? {get set}
    
    func getYesLabel() -> String
    func getNoLabel() -> String
    
}

final class AddReviewViewModel: NSObject {

    let service: MapServiceProtocol
    var updateName: ((String) -> Void)?
    
    var getMaskCustomerValue: (() -> Bool)?
    var getMaskEmployeValue: (() -> Bool)?
    var getDistancingValue: (() -> Bool)?
    var getHandGelValue: (() -> Bool)?
    var getPaymentValue: (() -> Bool)?
    var getSecurityValue: (() -> Bool)?
    var getCleanValue: (() -> Bool)?
    var getQualityValue: (() -> Int)?
    var popToPreviousView: (() -> Void)?
    
    private var place: GMSPlace? {
        didSet {
            updateInformations()
        }
    }
    
    init(service: MapServiceProtocol) {
        self.service = service
    }
    
    private func updateInformations() {
        if let name = place?.name {
            updateName?("\("name_label".localizedString): \(String(describing: name))")
        }
    }
}

extension AddReviewViewModel: AddReviewViewModelProtocol {
    func fetchLocation(coordinate: GMSPlace) {
        place = coordinate
    }
    
    func getMaskCustomer() -> String {
        return "mask_customer_label".localizedString
    }
    
    func getMaskEmploye() -> String {
        return "mask_employe_label".localizedString
    }
    
    func getDistance() -> String {
        return "distancing_label".localizedString
    }
    
    func getHandGel() -> String {
        return "hand_gel_label".localizedString
    }
    
    func getPayment() -> String {
        return "payment_label".localizedString
    }
    
    func getSecurity() -> String {
        return "security_label".localizedString
    }
    
    func getClean() -> String {
        return "clean_label".localizedString
    }
    
    func getQuality() -> String {
        return "quality_label".localizedString
    }
    
    func getSearchButton() -> String {
        return "search_button_title".localizedString
    }
    
    func getYesLabel() -> String {
        return "yes_label".localizedString
    }
    
    func getNoLabel() -> String {
        return "no_label".localizedString
    }
    
    func getNavTitle() -> String {
        return "save_label".localizedString
    }
    
    func donePressed() {
        service.addValue(name: place?.name ?? "",
                         location: place?.coordinate ?? CLLocationCoordinate2D.init(latitude: 0.0, longitude: 0.0),
                         address: place?.formattedAddress ?? "",
                         maskCutomer: getMaskCustomerValue?() ?? false,
                         maskEmploye: getMaskEmployeValue?() ?? false,
                         distancing: getDistancingValue?() ?? false,
                         handGel: getHandGelValue?() ?? false,
                         payment: getPaymentValue?() ?? false,
                         security: getSecurityValue?() ?? false,
                         clean: getCleanValue?() ?? false,
                         quality: getQualityValue?() ?? 0) { (result) in
                            switch result {
                            case .success:
                                self.popToPreviousView?()
                            case .failure(let error): break
                            }
        }
    }
}
