//
//  MapService.swift
//  HelpCov
//
//  Created by Antoine Simon on 29/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import MapKit
import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol MapServiceProtocol: AnyObject {
    func addValue(name: String, subtitle: String,location: CLLocationCoordinate2D, completion: @escaping ((Result<Void, Error>) -> Void))
    func getValue(completion: @escaping ((Result<[MapPoint], Error>) -> Void))
}

final class MapService: NSObject {
    let userID = Auth.auth().currentUser?.uid
    var ref: DatabaseReference = Database.database().reference()
}

extension MapService: MapServiceProtocol {
    func getValue(completion: @escaping ((Result<[MapPoint], Error>) -> Void)) {
        ref.child("items").observe(.value) { (snapshot) in
            completion(.success(Parser().parseItemList(snapshot: snapshot)))
        }
    }
    
    func addValue(name: String, subtitle: String,location: CLLocationCoordinate2D, completion: @escaping ((Result<Void, Error>) -> Void)) {
        let ID = ref.childByAutoId().key!
        let entry: [String: Any] = ["autoID" : ID,
                                    "title" : name,
                                    "subtitle" : subtitle,
                                    "latitude" : location.latitude,
                                    "longitude" : location.longitude]
        
        ref.child("items").child(ID).setValue(entry) { (Error, DatabaseReference) in
            if let error = Error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
//    "name_label" = "Name";
//    "mask_customer_label" = "Face mask mandatory for customers";
//    "mask_employe_label" = "Face mask mandatory for employees";
//    "distancing_label" = "Social distancing respected";
//    "hand_gel_label" = "Free hand gel for customers";
//    "payment_label" = "Contact less payment";
//    "security_label" = "Did you feel in security after visiting this place ?";
//    "clean_label" = "Is it clean ?";
//    "quality_label" = "Quality of service";
//    "search_button_title" = "Search address";
//    func updateValue()
}
