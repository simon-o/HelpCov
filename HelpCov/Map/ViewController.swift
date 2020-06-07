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
        viewModel?.displayInfos = displayInfos
        viewModel?.removeMarkers = removeMarkers
        
        navigationController?.title = "HelpCov"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "filter_label".localizedString, style: .plain, target: self, action: #selector(filterPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add_label".localizedString, style: .plain, target: self, action: #selector(addPressed))
        
        map.showsUserLocation = true
        map.delegate = self
    }
    
    @objc private func filterPressed() {
        let controller = FilterViewController()
        controller.returnFilters = applyFilters
        self.present(controller, animated: true)
    }
    
    func applyFilters(filters: Int) {
        viewModel?.apply(filters: filters)
    }
    
    @objc private func addPressed() {
        self.present(AddReviewViewController(), animated: true, completion: nil)
    }
    
    private func displayInfos(view: ReviewTableViewController) {
        self.present(view, animated: true)
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
    
    private func removeMarkers(markers: [MKPointAnnotation]) {
        map.removeAnnotations(markers)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MKPointAnnotation else { return }
        viewModel?.searchMarker(mark: annotation)
    }
}
