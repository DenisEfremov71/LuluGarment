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
    
    var realm: Realm!
    
    func addGarment(_ garment: Garment) throws {
        
        do {
            realm = try Realm()
        } catch {
            throw RealmError.instanceCreationFailed
        }
        
        garment.creationTime = Date()
        
        do {
            try realm.write {
                realm.add(garment)
            }
        } catch {
            throw RealmError.writeTransactionFailed
        }
    }
    
    func getAllGarments() throws -> [Garment] {
        
        do {
            realm = try Realm()
        } catch {
            throw RealmError.instanceCreationFailed
        }
        
        let garments = realm.objects(Garment.self)
        
        return garments.map({$0})
    }
    
    func updateGarment(_ garment: Garment, newName name: String) throws {
        
        do {
            realm = try Realm()
        } catch {
            throw RealmError.instanceCreationFailed
        }
        
        do {
            try realm.write {
                garment.name = name
            }
        } catch {
            throw RealmError.writeTransactionFailed
        }
    }
    
    func deleteGarment (_ garment: Garment) throws {
        
        do {
            realm = try Realm()
        } catch {
            throw RealmError.instanceCreationFailed
        }
        
        do {
            try realm.write {
                realm.delete(garment)
            }
        } catch {
            throw RealmError.writeTransactionFailed
        }
    }
    
    func deleteAllGarments() throws {
                
        do {
            realm = try Realm()
        } catch {
            throw RealmError.instanceCreationFailed
        }
        
        let allGarments = realm.objects(Garment.self)
        
        do {
            try realm.write {
                realm.delete(allGarments)
            }
        } catch {
            throw RealmError.writeTransactionFailed
        }
    }
    
    func getGarment(by name: String) throws -> Garment? {
        
        do {
            realm = try Realm()
        } catch {
            throw RealmError.instanceCreationFailed
        }
        
        let predicate = NSPredicate(format: "name = %@", name)
        let garment = realm.objects(Garment.self).filter(predicate).first
        return garment
    }
    
}
