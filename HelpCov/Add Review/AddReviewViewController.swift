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
    
    @IBOutlet private weak var searchButton: UIButton!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameView: UIView!
    
    @IBOutlet private weak var maskCustomerLabel: UILabel!
    @IBOutlet private weak var maskCustomerSegmented: UISegmentedControl!
    
    @IBOutlet private weak var maskEmployeLabel: UILabel!
    @IBOutlet private weak var maskEmployeSegmented: UISegmentedControl!
    
    @IBOutlet private weak var distancingLabel: UILabel!
    @IBOutlet private weak var distancingSegmented: UISegmentedControl!
    
    @IBOutlet private weak var handGelLabel: UILabel!
    @IBOutlet private weak var handGelSegmented: UISegmentedControl!
    
    @IBOutlet private weak var paymentLabel: UILabel!
    @IBOutlet private weak var paymentSegmented: UISegmentedControl!
    
    @IBOutlet private weak var securityLabel: UILabel!
    @IBOutlet private weak var securitySegmented: UISegmentedControl!
    
    @IBOutlet private weak var cleanLabel: UILabel!
    @IBOutlet private weak var cleanSegmented: UISegmentedControl!
    
    @IBOutlet private weak var qualityLabel: UILabel!
    @IBOutlet private weak var quantitySegmented: UISegmentedControl!
    
    @IBOutlet private weak var saveButton: UIButton!
    
    @IBOutlet private var ArraySegmented: [UISegmentedControl]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchVC = SearchAddressViewController()
        
        setUp()
        setUpSegmented()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel?.donePressed()
    }
    
    private func setUp() {
        viewModel = AddReviewViewModel(service: MapService())
        searchVC?.fetchLocation = viewModel?.fetchLocation
        viewModel?.updateName = updateName
        
        nameLabel.text = nil
        nameView.isHidden = true
        maskCustomerLabel.text = viewModel?.getMaskCustomer()
        maskEmployeLabel.text = viewModel?.getMaskEmploye()
        distancingLabel.text = viewModel?.getDistance()
        handGelLabel.text = viewModel?.getHandGel()
        paymentLabel.text = viewModel?.getPayment()
        securityLabel.text = viewModel?.getSecurity()
        cleanLabel.text = viewModel?.getClean()
        qualityLabel.text = viewModel?.getQuality()
        searchButton.setTitle(viewModel?.getSearchButton(), for: .normal)
        saveButton.setTitle(viewModel?.getSaveButton(), for: .normal)
        
        viewModel?.getMaskCustomerValue = getMaskCustomerValue
        viewModel?.getMaskEmployeValue = getMaskEmployeValue
        viewModel?.getDistancingValue = getDistancingValue
        viewModel?.getHandGelValue = getHandGelValue
        viewModel?.getPaymentValue = getPaymentValue
        viewModel?.getSecurityValue = getSecurityValue
        viewModel?.getCleanValue = getCleanValue
        viewModel?.getQualityValue = getQualityValue
        viewModel?.popToPreviousView = popToPreviousView
    }
    
    private func popToPreviousView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func getMaskCustomerValue() -> Bool {
        return maskCustomerSegmented.isTrue()
    }
    private func getMaskEmployeValue() -> Bool {
        return maskEmployeSegmented.isTrue()
    }
    private func getDistancingValue() -> Bool {
        return distancingSegmented.isTrue()
    }
    private func getHandGelValue() -> Bool {
        return handGelSegmented.isTrue()
    }
    private func getPaymentValue() -> Bool {
        return paymentSegmented.isTrue()
    }
    private func getSecurityValue() -> Bool {
        return securitySegmented.isTrue()
    }
    private func getCleanValue() -> Bool {
        return cleanSegmented.isTrue()
    }
    private func getQualityValue() -> Int {
        return quantitySegmented.selectedSegmentIndex + 1
    }
    private func updateName(name: String) {
        nameLabel.text = name
        nameView.isHidden = false
    }
    
    private func setUpSegmented() {
        for segmented in ArraySegmented {
            segmented.setTitle(viewModel?.getYesLabel(), forSegmentAt: 0)
            segmented.setTitle(viewModel?.getNoLabel(), forSegmentAt: 1)
        }
        
        for index in 0...4 {
            quantitySegmented.setTitle(String(index + 1), forSegmentAt: index)
        }
    }

    @IBAction func searchAddressPressed(_ sender: Any) {
        if let tmpSearchVC = searchVC {
            self.present(tmpSearchVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        viewModel?.donePressed()
    }
}
