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
    
//    func updateValue()
}
