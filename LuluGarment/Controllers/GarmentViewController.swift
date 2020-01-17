//
//  NewGarmentViewController.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-16.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import UIKit

class GarmentViewController: UIViewController {
    
    // MARK: - Properties
    
    var garment: Garment?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var newGarmentName: UITextField!
    
    // MARK: - View controller life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        newGarmentName.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction func saveNewGarment(_ sender: Any?) {
        let result = validateNewGarmentName()
        if result.0 == false {
            appDelegate.errorPresenter.message = result.1!.rawValue
            appDelegate.errorPresenter.present(in: self)
            return
        }
        // add a new garment
        if garment == nil {
            appDelegate.garmentPresenter.addGarment(newGarmentName.text!)
        } else { // update
            appDelegate.garmentPresenter.updateGarment(garment!, newName: newGarmentName.text!)
        }
        cancel(nil)
    }
    
    @IBAction func cancel(_ sender: Any?) {
        self.dismiss(animated: true, completion: nil)
    }
}
