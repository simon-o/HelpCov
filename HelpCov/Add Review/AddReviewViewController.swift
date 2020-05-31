//
//  AddReviewViewController.swift
//  HelpCov
//
//  Created by Antoine Simon on 29/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

final class AddReviewViewController: UIViewController {
    
    private var viewModel: AddReviewViewModelProtocol?
    
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
        
        nameLabel.text = "name_label".localizedString
        maskCustomerLabel.text = "mask_customer_label".localizedString
        maskEmployeLabel.text = "mask_employe_label".localizedString
        distancingLabel.text = "distancing_label".localizedString
        handGelLabel.text = "hand_gel_label".localizedString
        paymentLabel.text = "payment_label".localizedString
        securityLabel.text = "security_label".localizedString
        cleanLabel.text = "clean_label".localizedString
        qualityLabel.text = "quality_label".localizedString
    }
    
    private func setUpSegmented() {
        for segmented in ArraySegmented {
            segmented.setTitle("yes_label".localizedString, forSegmentAt: 0)
            segmented.setTitle("no_label".localizedString, forSegmentAt: 1)
        }
    }
    
    @objc private func donePressed() {
        viewModel?.donePressed()
    }
}
