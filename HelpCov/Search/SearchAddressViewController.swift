//
//  SearchAddressViewController.swift
//  HelpCov
//
//  Created by Antoine Simon on 01/06/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class SearchAddressViewController: UIViewController {

    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchController()
    }

    func setupSearchController() {
        resultsViewController = GMSAutocompleteResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController

        let searchBar = searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = searchController?.searchBar
        definesPresentationContext = true
        searchController?.hidesNavigationBarDuringPresentation = false
    }
    
    
//    var resultsViewController: GMSAutocompleteResultsViewController?
//       var searchController: UISearchController?
//       override func viewDidLoad() {
//           super.viewDidLoad()
//           self.title = "Select Addres"
//           resultsViewController = GMSAutocompleteResultsViewController()
//           resultsViewController?.delegate = self
//           searchController = UISearchController(searchResultsController: resultsViewController)
//           searchController?.searchResultsUpdater = resultsViewController
//           let subView = UIView(frame: CGRect(x: 0, y: 100, width: 100, height: 45.0))
//           subView.addSubview((searchController?.searchBar)!)
//           view.addSubview(subView)
//           definesPresentationContext = true
//           // Do any additional setup after loading the view.
//       }
//
//       @IBAction func cancelAct(_ sender: Any) {
//           self.dismiss(animated: true, completion: nil)
//       }
}


//extension SearchAddressViewController: GMSAutocompleteResultsViewControllerDelegate {
//    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
//                           didAutocompleteWith place: GMSPlace) {
//        searchController?.isActive = false
//        // Do something with the selected place.
//        print("Place Address: \(place.formattedAddress)")
//        searchController?.searchBar.text = place.formattedAddress
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
//                           didFailAutocompleteWithError error: Error){
//        // TODO: handle the error.
//        print("Error: ", error.localizedDescription)
//    }
//
//    // Turn the network activity indicator on and off again.
//    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//    }
//
//    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//    }
//}
//
