//
//  List+Convenience.swift
//  Shopping
//
//  Created by DANIEL CORNWELL on 2/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import Foundation
import CoreData




import CoreData

extension List {
    
    
    // add discard with the name of the datacore file....
    @discardableResult   convenience init(title: String, isCompeted: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.title = title
        self.isCompeted = isCompeted
        
    }
}
