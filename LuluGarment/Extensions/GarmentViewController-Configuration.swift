//
//  GarmentViewController-Configuration.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import Foundation

extension GarmentViewController {
    
    func configureView() {
        if garment == nil {
            navigationBar.topItem?.title = "New Garment"
        } else {
            if let name = garment?.name {
                newGarmentName.text = name
                navigationBar.topItem?.title = "Edit Garment"
            }
        }
    }
    
    func validateNewGarmentName() -> (Bool, GarmentValidationError?) {
        let name = newGarmentName.text!
        var garment: Garment?
        do {
            garment = try appDelegate.garmentPresenter.getGarment(by: name)
        } catch {
            appDelegate.errorPresenter.message = (error as! RealmError).rawValue
            appDelegate.errorPresenter.present(in: self, style: .alert, title: "Error")
            return (false, GarmentValidationError.forwarded)
        }
        
        if name.count == 0 {
            return (false, GarmentValidationError.emptyName)
        } else if name.count > 0 && garment != nil {
            return (false, GarmentValidationError.existingName)
        }
        return (true, nil)
    }
    
}
