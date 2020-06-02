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
    
    var updateName: ((String) -> Void)? {get set}
    
}

final class AddReviewViewModel: NSObject {

    let service: MapServiceProtocol
    var updateName: ((String) -> Void)?
    
    init(service: MapServiceProtocol) {
        self.service = service
    }
}

extension AddReviewViewModel: AddReviewViewModelProtocol {
    func fetchLocation(coordinate: GMSPlace) {
        if let name = coordinate.name {
            updateName?("\("name_label".localizedString): \(String(describing: name))")
        }
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
    
    func donePressed() {
        service.addValue(name: "test", subtitle: "test", location: CLLocationCoordinate2D.init(latitude: 51.552325, longitude: -0.1961228)) { (result) in
            print(result)
        }
    }
    
    
}
