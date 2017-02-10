//
//  ListController.swift
//  Shopping
//
//  Created by DANIEL CORNWELL on 2/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import Foundation
import CoreData

class ListController {
static let share = ListController()

//CRUD

//Add
func add(title: String) {
    let _ = List(title: title)
    saveToPersistenStore()
}

//Read
var lists: [List] {
    
    let request: NSFetchRequest<List> = List.fetchRequest()
    
    let moc = CoreDataStack.context
    
    do{
        let lists = try moc.fetch(request)
        return lists
    } catch {
        return []
    }
}

//Update
func toggleBuddy(list: List) {
    list.isCompeted = !list.isCompeted
    saveToPersistenStore()
}

//Delete
func delete(list: List) {
    let moc = CoreDataStack.context
    
    moc.delete(list)
    saveToPersistenStore()
}

//Save
func saveToPersistenStore() {
    
    let moc = CoreDataStack.context
    
    do {
        try moc.save()
    } catch let error {
        print("Error saving MOC:\n\(error)")
    }
    
}
}

