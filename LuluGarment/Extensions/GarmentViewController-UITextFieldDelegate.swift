//
//  GarmentViewController-UITextFieldDelegate.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import Foundation
import UIKit

extension GarmentViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        self.saveNewGarment(nil)
        return false
    }
    
}
