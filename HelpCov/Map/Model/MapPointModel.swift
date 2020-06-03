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

final class Parser {
    func parseItemList(snapshot: DataSnapshot) -> [MapPoint] {
        let value = snapshot.value as? NSDictionary
        let keys = value?.allKeys
        
        var itemsList: [MapPoint] = []
        keys?.forEach({ (key) in
            let item = value?[key] as? [String: Any]
            itemsList.append(MapPoint.init(title: item?["title"] as! String,
                                           latitude: item?["latitude"] as! Double,
                                           longitude: item?["longitude"] as! Double,
                                           address: item?["address"] as! String,
                                           maskCustomer: item?["maskCustomer"] as! Bool,
                                           maskEmploye: item?["maskEmploye"] as! Bool,
                                           distancing: item?["distancing"] as! Bool,
                                           handgel: item?["handgel"] as! Bool,
                                           payment: item?["payment"] as! Bool,
                                           security: item?["security"] as! Bool,
                                           clean: item?["clean"] as! Bool,
                                           quality: item?["quality"] as! Bool
            ))
        })
        return itemsList
    }
}
