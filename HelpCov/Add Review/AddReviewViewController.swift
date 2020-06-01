//
//  AddReviewViewController.swift
//  HelpCov
//
//  Created by Antoine Simon on 29/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import MapKit

final class AddReviewViewController: UIViewController {
    
    private var viewModel: AddReviewViewModelProtocol?
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    
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
        
        setUp()
        setUpSegmented()
    }
    
    private func setUp() {
        viewModel = AddReviewViewModel(service: MapService())
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save_label".localizedString, style: .plain, target: self, action: #selector(donePressed))
        
        //move to viewModel
        nameLabel.text = "name_label".localizedString
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
        navigationController?.show(SearchAddressViewController(), sender: nil)
    }
    
    func getAddressFrom(url: String) {
        //        let location = CLLocation.init(latitude: 43.601860, longitude: 1.243202)
        //        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
        //            guard let placemarks = placemarks, let location = placemarks.first?.administrativeArea else {return}
        //            print(location)
        //        }
    }
}
