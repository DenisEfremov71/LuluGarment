//
//  GarmentListViewController-Configuration.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import Foundation

extension GarmentListViewController {
    
    func loadData() {
        if let garments = appDelegate.garmentPresenter.getGarments() {
            garmentArray = garments
        }
    }
    
    func configureView() {
        let sortOption = defaults.integer(forKey: "Sort")
        sortGarmentArray(sortOption: sortOption)
        segmentedControl.selectedSegmentIndex = sortOption
        tableView.reloadData()
    }
    
    func sortGarmentArray(sortOption: Int) {
        if sortOption == 0 {
            garmentArray.sort { (val1, val2) -> Bool in
                return val1.name < val2.name
            }
        } else if sortOption == 1 {
            // most recent first
            garmentArray.sort { (val1, val2) -> Bool in
                return val1.creationTime > val2.creationTime
            }
        }
    }
    
}
