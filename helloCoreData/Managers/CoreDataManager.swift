//
//  CoreDataManager.swift
//  helloCoreData
//
//  Created by Antony Mboukou on 20/02/2021.
//

import Foundation
import CoreData


// will initialize CoraData to create, retrieve, update or delete a movie
class CoreDataManager {
    
    
    let persistentContainer: NSPersistentContainer // initialize the Core Data stack
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            
// if we get an error...
            if let error = error {
                fatalError("Initialize Core Data failed \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
}
