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
        searchVC?.fetchLocation = viewModel?.fetchLocation
        viewModel?.updateName = updateName
        
        //move
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel?.getNavTitle(), style: .plain, target: self, action: #selector(donePressed))
        
        nameLabel.text = nil
        maskCustomerLabel.text = viewModel?.getMaskCustomer()
        maskEmployeLabel.text = viewModel?.getMaskEmploye()
        distancingLabel.text = viewModel?.getDistance()
        handGelLabel.text = viewModel?.getHandGel()
        paymentLabel.text = viewModel?.getPayment()
        securityLabel.text = viewModel?.getSecurity()
        cleanLabel.text = viewModel?.getClean()
        qualityLabel.text = viewModel?.getQuality()
        searchButton.setTitle(viewModel?.getSearchButton(), for: .normal)
        
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
    private func getQualityValue() -> Bool {
        return quantitySegmented.isTrue()
    }
    private func updateName(name: String) {
        nameLabel.text = name
    }
    
    private func setUpSegmented() {
        for segmented in ArraySegmented {
            segmented.setTitle(viewModel?.getYesLabel(), forSegmentAt: 0)
            segmented.setTitle(viewModel?.getNoLabel(), forSegmentAt: 1)
        }
    }
    
    @objc private func donePressed() {
        viewModel?.donePressed()
    }

    @IBAction func searchAddressPressed(_ sender: Any) {
        if let tmpSearchVC = searchVC {
            navigationController?.show(tmpSearchVC, sender: nil)
        }
    }
}
