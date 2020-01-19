//
//  ErrorPresenter.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-16.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import Foundation
import UIKit

struct ErrorPresenter {
    
    var message: String
    
    func present(in viewController: UIViewController, style: UIAlertController.Style, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        if style == .alert {
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
        } else if style == .actionSheet {
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            alertController.addAction(UIAlertAction(title: "Delete All", style: UIAlertAction.Style.destructive, handler: { action in
                if viewController is GarmentListViewController {
                    (viewController as! GarmentListViewController).deleteAllGarments()
                }
            }))
        }
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
