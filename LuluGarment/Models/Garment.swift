//
//  Garment.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-16.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import Foundation
import RealmSwift

class Garment: Object {
    @objc dynamic var name = ""
    @objc dynamic var creationTime = Date()
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
