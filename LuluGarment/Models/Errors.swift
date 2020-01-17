//
//  Errors.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import Foundation

enum GarmentValidationError: String, Error {
    case emptyName = "Garment name is empty"
    case existingName = "Garment name already exists"
}