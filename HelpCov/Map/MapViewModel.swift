//
//  MapViewModel.swift
//  HelpCov
//
//  Created by Antoine Simon on 15/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewModelProtocol {
    func getLocation()
    func loadMarker()
    func searchMarker(mark: MKPointAnnotation)
    
    var updateLocalisation: ((CLLocationCoordinate2D) -> Void)? {get set}
    var addMarker: (([MKPointAnnotation]) -> Void)? {get set}
}

final class MapViewModel: NSObject {
    var updateLocalisation: ((CLLocationCoordinate2D) -> Void)?
    var addMarker: (([MKPointAnnotation]) -> Void)?
    let service: MapServiceProtocol
    var list: [ListPoint]? {
        didSet {
            self.listMark = self.createAnnotation()
        }
    }
    private let locationManager = CLLocationManager()
    private var listMark: [MKPointAnnotation]? {
        didSet {
            if let tmp = addMarker {
                tmp(listMark ?? [])
            }
        }
    }
    
    init(service: MapServiceProtocol) {
        self.service = service
    }
    
    private func createAnnotation() -> [MKPointAnnotation] {
        var returnArray = [MKPointAnnotation]()
        guard let list = list else {return returnArray}
        
        for point in list {
            let annotation = MKPointAnnotation()
            annotation.coordinate = point.array.first?.locationCoordinate() ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
            annotation.title = point.array.first?.title
            returnArray.append(annotation)
        }
        return returnArray
    }
}

extension MapViewModel: MapViewModelProtocol {
    func searchMarker(mark: MKPointAnnotation) {
        if let list = listMark {
            for tmp in list {
                if mark == tmp {
                    
                }
            }
        }
    }
    
    func getLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func loadMarker() {
        service.getValue { (result) in
            switch result {
            case .success(let list):
                self.list = list
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}

extension MapViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        updateLocalisation!(locValue)
    }
    
    
}

private extension MKMapView {
    
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
