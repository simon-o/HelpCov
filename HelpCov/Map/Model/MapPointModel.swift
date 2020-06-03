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
    
    let latitude: Double
    let longitude: Double
    
    let address: String
    let maskCustomer: Bool
    let maskEmploye: Bool
    let distancing: Bool
    let handgel: Bool
    let payment: Bool
    let security: Bool
    let clean: Bool
    let quality: Bool
        
    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
}

struct ListPoint: Codable {
    var array: [MapPoint]
}

final class Parser {
    func parseItemList(snapshot: DataSnapshot) -> [MapPoint] {
        let value = snapshot.value as? NSDictionary
        let keys = value?.allKeys
        
        var itemsList: [MapPoint] = []
        
        keys?.forEach({ (key) in
            let item = value?[key] as? [String: [String: Any]]
            
            for (key, value2) in item! {
                print(value2["title"])
//                itemsList.array.append(MapPoint.init(title: tmp["title"] as! String,
//                                                          latitude: tmp["latitude"] as! Double,
//                                                          longitude: tmp["longitude"] as! Double,
//                                                          address: tmp["address"] as! String,
//                                                          maskCustomer: tmp["maskCustomer"] as! Bool,
//                                                          maskEmploye: tmp["maskEmploye"] as! Bool,
//                                                          distancing: tmp["distancing"] as! Bool,
//                                                          handgel: tmp["handgel"] as! Bool,
//                                                          payment: tmp["payment"] as! Bool,
//                                                          security: tmp["security"] as! Bool,
//                                                          clean: tmp["clean"] as! Bool,
//                                                          quality: tmp["quality"] as! Bool
//                           ))
            }
        })
        return itemsList
    }
}
