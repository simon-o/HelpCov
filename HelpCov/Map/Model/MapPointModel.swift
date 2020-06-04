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
    let quality: Int
        
    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
}

struct ListPoint: Codable {
    var array: [MapPoint]
}

final class Parser {
    func parseItemList(snapshot: DataSnapshot) -> [ListPoint] {
        let value = snapshot.value as? NSDictionary
        let keys = value?.allKeys
        
        var itemsList: [ListPoint] = []
        
        
        keys?.forEach({ (key) in
            if let rawData = value?[key] as? [String: [String: Any]] {
                var listMapPoint: [MapPoint] = []
                
                for (_, dict) in rawData {
                    listMapPoint.append(MapPoint.init(title: dict["title"] as! String,
                                                       latitude: dict["latitude"] as! Double,
                                                       longitude: dict["longitude"] as! Double,
                                                       address: dict["address"] as! String,
                                                       maskCustomer: dict["maskCustomer"] as! Bool,
                                                       maskEmploye: dict["maskEmploye"] as! Bool,
                                                       distancing: dict["distancing"] as! Bool,
                                                       handgel: dict["handGel"] as! Bool,
                                                       payment: dict["payment"] as! Bool,
                                                       security: dict["security"] as! Bool,
                                                       clean: dict["clean"] as! Bool,
                                                       quality: dict["quality"] as! Int))
                }
                
                
                itemsList.append(ListPoint.init(array: listMapPoint))
            }
        })
        return itemsList
    }
}
