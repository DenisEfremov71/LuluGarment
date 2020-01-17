//
//  GarmentListViewController-UITableViewDataSource.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-16.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import Foundation
import UIKit

extension GarmentListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garmentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GarmentCell", for: indexPath) as! GarmentCell
        let garmentObject = garmentArray[indexPath.row]
        
        cell.garmentName.text = garmentObject.name
        cell.creationTime = garmentObject.creationTime
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let garmentObjectToDelete = garmentArray[indexPath.row]
            appDelegate.garmentPresenter.deleteGarment(garmentObjectToDelete)
            garmentArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
