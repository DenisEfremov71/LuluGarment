//
//  GarmentListViewController.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-16.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import UIKit

class GarmentListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: - Properties
    
    let defaults = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var garmentArray = [Garment]()
    
    // MARK: - View controller life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        configureView()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newGarmentVC = segue.destination as! GarmentViewController
        
        if let selectedGarmentIndexPath = self.tableView.indexPathForSelectedRow {
            newGarmentVC.garment = garmentArray[selectedGarmentIndexPath.row]
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func addNewGarment(_ sender: Any) {
        performSegue(withIdentifier: "garment", sender: nil)
    }
    
    @IBAction func orderGarmentList(_ sender: UISegmentedControl) {
        guard garmentArray.count > 0 else {
            return
        }
        sortGarmentArray(sortOption: sender.selectedSegmentIndex)
        defaults.set(sender.selectedSegmentIndex, forKey: "Sort")
        tableView.reloadData()
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        guard garmentArray.count > 0 else {
            return
        }
        appDelegate.errorPresenter.message = Messages.Alerts.deleteAll
        appDelegate.errorPresenter.present(in: self, style: .actionSheet, title: "Warning")
    }
}

