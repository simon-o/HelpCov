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
    func addValue(name: String ,location: CLLocationCoordinate2D, address: String, maskCutomer: Bool, maskEmploye: Bool, distancing: Bool, handGel: Bool, payment: Bool, security: Bool, clean: Bool, quality: Int, completion: @escaping ((Result<Void, Error>) -> Void))
    func getValue(completion: @escaping ((Result<[ListPoint], Error>) -> Void))
    func filter(child: String)
}

final class MapService: NSObject {
    let userID = Auth.auth().currentUser?.uid
    var ref: DatabaseReference = Database.database().reference()
}

extension MapService: MapServiceProtocol {
    func getValue(completion: @escaping ((Result<[ListPoint], Error>) -> Void)) {
        ref.child("items").observe(.value) { (snapshot) in
            completion(.success(Parser().parseItemList(snapshot: snapshot)))
        }
    }
    
    func addValue(name: String ,location: CLLocationCoordinate2D, address: String, maskCutomer: Bool, maskEmploye: Bool, distancing: Bool, handGel: Bool, payment: Bool, security: Bool, clean: Bool, quality: Int, completion: @escaping ((Result<Void, Error>) -> Void)) {
        
        let entry: [String: Any] = ["title" : name,
                                    "latitude" : location.latitude,
                                    "longitude" : location.longitude,
                                    "address" : address,
                                    "maskCustomer" : maskCutomer,
                                    "maskEmploye" : maskEmploye,
                                    "distancing" : distancing,
                                    "handGel" : handGel,
                                    "payment" : payment,
                                    "security" : security,
                                    "clean" : clean,
                                    "quality" : quality
        ]
        
        ref.child("items").child(address).childByAutoId().setValue(entry) { (Error, DatabaseReference) in
            if let error = Error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func filter(child: String) {
        let test = ref.child("items").queryOrdered(byChild: child).queryEqual(toValue: true)
        test.observe(.value) { (snapshot) in
            for childSnapshot in snapshot.children {
                print(childSnapshot)
            }
        }
        
    }
}
