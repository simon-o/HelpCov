//
//  Tools.swift
//  HelpCov
//
//  Created by Antoine Simon on 29/05/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

extension String {
    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UISegmentedControl {
    func isTrue() -> Bool {
        return self.selectedSegmentIndex == 0
    }
}

extension Bool {
    func convertString() -> String {
        return self == true ? "yes_label".localizedString : "no_label".localizedString
    }
}
