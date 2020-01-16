//
//  GarmentCell.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-16.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import UIKit

class GarmentCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var garmentName: UILabel!
    
    // MARK: - Properties
    
    var creationTime: Date?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
