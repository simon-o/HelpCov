//
//  AddReviewViewModel.swift
//  HelpCov
//
//  Created by Antoine Simon on 29/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import MapKit

protocol AddReviewViewModelProtocol {
    func donePressed()
}

final class AddReviewViewModel: NSObject {

    let service: MapServiceProtocol
    
    init(service: MapServiceProtocol) {
        self.service = service
    }
}

extension AddReviewViewModel: AddReviewViewModelProtocol {
    func donePressed() {
        service.addValue(name: "test", subtitle: "test", location: CLLocationCoordinate2D.init(latitude: 51.552325, longitude: -0.1961228)) { (result) in
            print(result)
        }
    }
}
