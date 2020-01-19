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
        do {
            garmentArray = try appDelegate.garmentPresenter.getAllGarments()
        } catch {
            appDelegate.errorPresenter.message = (error as! RealmError).rawValue
            appDelegate.errorPresenter.present(in: self, style: .alert, title: "Error")
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
    
    func deleteAllGarments() {
        do {
            try appDelegate.garmentPresenter.deleteAllGarments()
        } catch {
            appDelegate.errorPresenter.message = (error as! RealmError).rawValue
            appDelegate.errorPresenter.present(in: self, style: .alert, title: "Error")
            return
        }
        garmentArray.removeAll()
        tableView.reloadData()
    }
    
}
