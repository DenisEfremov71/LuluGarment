//
//  GarmentPresenter.swift
//  LuluGarment
//
//  Created by Denis Efremov on 2020-01-16.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import UIKit
import RealmSwift

class GarmentPresenter {
    
    func addGarment(_ name: String) {
        
        // TODO: add error handling
        let realm = try! Realm()
        
        let garment = Garment(name: name)
        garment.creationTime = Date()
        
        do {
            try realm.write {
                realm.add(garment)
            }
        } catch {
            // TODO: add error handling
            print(error.localizedDescription)
        }
        
    }
    
    func getGarments() -> [Garment]? {
        
        // TODO: add error handling
        let realm = try! Realm()
        
        let garments = realm.objects(Garment.self)
        
        return garments.map({$0})
    }
    
    func updateGarment(_ garment: Garment, newName name: String) {
        
        // TODO: add error handling
        let realm = try! Realm()
        
        do {
            try realm.write {
                garment.name = name
            }
        } catch {
            // TODO: add error handling
            print(error.localizedDescription)
        }
    }
    
    func deleteGarment (_ garment: Garment) {
        
        // TODO: add error handling
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.delete(garment)
            }
        } catch {
            // TODO: add error handling
            print(error.localizedDescription)
        }
    }
    
    func garmentExists(_ name: String) -> Bool {
        
        let predicate = NSPredicate(format: "name = %@", name)
        
        // TODO: add error handling
        let realm = try! Realm()
        
        if realm.objects(Garment.self).filter(predicate).first != nil {
            return true
        } else {
            return false
        }
        
    }
    
}
