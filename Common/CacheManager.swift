//
//  CacheManager.swift
//  CountriesInfoDemo
//
//  Created by AhmedFitoh on 12/29/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CacheManager {
    
    static var persistentContainer: NSPersistentContainer {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }
    
    func searchInDatabaseFor (text: String) -> Countries? {
        let context = CacheManager.persistentContainer.viewContext
        let request = Country.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", text)
        request.returnsObjectsAsFaults = false
        if let countries = try? context.fetch(request) as? Countries {
            return countries
        } else {
            return nil
        }
    }
    func retiveAllUserChoices () -> Countries? {
        let context = CacheManager.persistentContainer.viewContext
        let request = Country.fetchRequest()
        request.predicate = NSPredicate(format: "userChoice == YES")
        request.returnsObjectsAsFaults = false
        if let countries = try? context.fetch(request) as? Countries {
            return countries
        } else {
            return nil
        }
    }
    
    
    
    func deleteAll () {
        let fetchRequest = Country.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try CacheManager.persistentContainer.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
        
    }
    func deleteCountry (country: Country) {
        CacheManager.persistentContainer.viewContext.delete(country)
        do {
            try CacheManager.persistentContainer.viewContext.save()
            
        } catch {
            print(error)
        }
    }
    
    func saveDataLocaly (data : Countries) {
        let context = CacheManager.persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        for item in data {
            let newUser = NSManagedObject(entity:  Country.entity(), insertInto: context)
            newUser.setValue(item.name, forKey: "name")
            newUser.setValue(item.capital, forKey: "capital")
            newUser.setValue(item.userChoice, forKey: "userChoice")
            
        }
        do {
            try context.save()
        } catch {
            print(error)
        }
        context.reset()
    }
    
    
}
