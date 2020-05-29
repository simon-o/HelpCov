//
//  MapPointModel.swift
//  HelpCov
//
//  Created by Antoine Simon on 29/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import FirebaseDatabase
import MapKit
import Firebase
import FirebaseCore

struct MapPoint: Codable {
    let title: String
    let subtitle: String
    let latitude: Double
    let longitude: Double
    
//    let faceMask: Bool
    
    
    
    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
}

final class Parser {
    func parseItemList(snapshot: DataSnapshot) -> [MapPoint] {
        let value = snapshot.value as? NSDictionary
        let keys = value?.allKeys
        
        
        //------------------
//        do {
//            let person = try FirebaseDecoder().decode(MapPoint.self, from: value)
//            print(person)
//        } catch let error {
//            print(error)
//        }
        //pod 'CodableFirebase'
        //------------------
        
        
        
        
        
        
        var itemsList: [MapPoint] = []
        keys?.forEach({ (key) in
            let item = value?[key] as? [String: Any]
            itemsList.append(MapPoint.init(title: item?["title"] as! String,
                                           subtitle: item?["subtitle"] as! String,
                                           latitude: item?["latitude"] as! Double,
                                           longitude: item?["longitude"] as! Double
            ))
        })
        return itemsList
    }
}
