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
    
    
    
    
    func getAllMovies() -> [Movie] {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    

    
    func saveMovie(title: String) {
        // viewContext accessing the context available in the main thread
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Faile to save movie \(error)")
        }


    }
    
    func updateMovie() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
    
    func deleteMovie(movie: Movie) {
        
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
    
}
