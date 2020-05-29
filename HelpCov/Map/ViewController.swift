//
//  ViewController.swift
//  HelpCov
//
//  Created by Antoine Simon on 15/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import MapKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var map: MKMapView!
    
    private var viewModel: MapViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        startMap()
    }

    private func setUp() {
        viewModel = MapViewModel(service: MapService())
        
        viewModel?.updateLocalisation = updateLocalisation
        viewModel?.addMarker = addMarker
        
        navigationController?.title = "HelpCov"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addPressed))
        
        map.showsUserLocation = true
        map.delegate = self
    }
    
    @objc private func addPressed(){
        navigationController?.show(AddReviewViewController(), sender: nil)
    }
    
    private func startMap() {
        viewModel?.getLocation()
        viewModel?.loadMarker()
    }
    
    private func updateLocalisation(local: CLLocationCoordinate2D) {

    }
    
    private func addMarker(markers: [MKPointAnnotation]) {
        for mark in markers {
            map.addAnnotation(mark)
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MKPointAnnotation else { return }
        viewModel?.searchMarker(mark: annotation)
    }
}
