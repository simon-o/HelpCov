//
//  AddReviewViewController.swift
//  HelpCov
//
//  Created by Antoine Simon on 29/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces

final class AddReviewViewController: UIViewController {
    
    private var viewModel: AddReviewViewModelProtocol?
    private var searchVC: SearchAddressViewController?
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var maskCustomerLabel: UILabel!
    @IBOutlet weak var maskCustomerSegmented: UISegmentedControl!
    
    @IBOutlet weak var maskEmployeLabel: UILabel!
    @IBOutlet weak var maskEmployeSegmented: UISegmentedControl!
    
    @IBOutlet weak var distancingLabel: UILabel!
    @IBOutlet weak var distancingSegmented: UISegmentedControl!
    
    @IBOutlet weak var handGelLabel: UILabel!
    @IBOutlet weak var handGelSegmented: UISegmentedControl!
    
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var paymentSegmented: UISegmentedControl!
    
    @IBOutlet weak var securityLabel: UILabel!
    @IBOutlet weak var securitySegmented: UISegmentedControl!
    
    @IBOutlet weak var cleanLabel: UILabel!
    @IBOutlet weak var cleanSegmented: UISegmentedControl!
    
    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var quantitySegmented: UISegmentedControl!
    
    @IBOutlet var ArraySegmented: [UISegmentedControl]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchVC = SearchAddressViewController()
        
        setUp()
        setUpSegmented()
    }
    
    private func setUp() {
        viewModel = AddReviewViewModel(service: MapService())
        searchVC?.fetchLocation = fetchLocation
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save_label".localizedString, style: .plain, target: self, action: #selector(donePressed))
        
        //move to viewModel
        nameLabel.text = nil
        maskCustomerLabel.text = "mask_customer_label".localizedString
        maskEmployeLabel.text = "mask_employe_label".localizedString
        distancingLabel.text = "distancing_label".localizedString
        handGelLabel.text = "hand_gel_label".localizedString
        paymentLabel.text = "payment_label".localizedString
        securityLabel.text = "security_label".localizedString
        cleanLabel.text = "clean_label".localizedString
        qualityLabel.text = "quality_label".localizedString
        searchButton.setTitle("search_button_title".localizedString, for: .normal)
    }
    
    private func fetchLocation(coordinate: GMSPlace) {
        //move same
        if let name = coordinate.name {
            nameLabel.text = "\("name_label".localizedString): \(String(describing: name))"
        }
    }
    
    private func setUpSegmented() {
        //same move
        for segmented in ArraySegmented {
            segmented.setTitle("yes_label".localizedString, forSegmentAt: 0)
            segmented.setTitle("no_label".localizedString, forSegmentAt: 1)
        }
    }
    
    @objc private func donePressed() {
        viewModel?.donePressed()
    }
    
    func  test() {
        let address = "waitrose, west hampstead, nw61rn"

        CLGeocoder().geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks, let location = placemarks.first?.location else {return}
            print(location)
        }
    }
    

    @IBAction func searchAddressPressed(_ sender: Any) {
        if let tmpSearchVC = searchVC {
            navigationController?.show(tmpSearchVC, sender: nil)
        }
    }
    
    func getAddressFrom(url: String) {
        //        let location = CLLocation.init(latitude: 43.601860, longitude: 1.243202)
        //        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
        //            guard let placemarks = placemarks, let location = placemarks.first?.administrativeArea else {return}
        //            print(location)
        //        }
    }
}
