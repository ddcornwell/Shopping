//
//  DataCoreStack.swift
//  Shopping
//
//  Created by DANIEL CORNWELL on 2/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//


import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        //Name is the same as the app Name...
        let container = NSPersistentContainer(name: "Shopping")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}

