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
    func addValue(name: String ,location: CLLocationCoordinate2D, address: String, maskCutomer: Bool, maskEmploye: Bool, distancing: Bool, hangGel: Bool, payment: Bool, security: Bool, clean: Bool, quality: Bool, completion: @escaping ((Result<Void, Error>) -> Void))
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
    
    func addValue(name: String ,location: CLLocationCoordinate2D, address: String, maskCutomer: Bool, maskEmploye: Bool, distancing: Bool, hangGel: Bool, payment: Bool, security: Bool, clean: Bool, quality: Bool, completion: @escaping ((Result<Void, Error>) -> Void)) {
        
        let entry: [String: Any] = ["title" : name,
                                    "latitude" : location.latitude,
                                    "longitude" : location.longitude,
                                    "address" : address,
                                    "maskCutomer" : maskCutomer,
                                    "maskEmploye" : maskEmploye,
                                    "distancing" : distancing,
                                    "hangGel" : hangGel,
                                    "payment" : payment,
                                    "security" : security,
                                    "clean" : clean,
                                    "quality" : quality
        ]
        
        ref.child("items").child(address).setValue(entry) { (Error, DatabaseReference) in
            if let error = Error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
