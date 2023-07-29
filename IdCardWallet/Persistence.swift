//
//  Presistence.swift
//  IdCardWallet
//
//  Created by Dimas Aristyo Rahadian on 24/07/23.
//

import CoreData

class PersistenceController{
    // Singleton instance of PersistenceController
       static let shared = PersistenceController()
       
       // Lazily initialized instance for preview/testing purposes
       static var preview: PersistenceController = {
           // Create a PersistenceController with an in-memory store (for testing)
           let result = PersistenceController(inMemory: true)
           let viewContext = result.container.viewContext
           
           // Populate the database with 10 sample AccountData objects
           for _ in 0..<10 {
               let newItem = DataPeople(context: viewContext)
               newItem.creationDate = Date()
           }
           
           do {
               // Save the changes to the managed object context (in-memory store)
               try viewContext.save()
           } catch {
               // Handle errors appropriately (e.g., log the error)
               fatalError("Unresolved error \(error), \(error.localizedDescription)")
           }
           
           // Return the initialized PersistenceController
           return result
       }()
       
       // The Core Data persistent container
       let container: NSPersistentContainer
       
       // Private initializer to create the Core Data persistent container
       private init(inMemory: Bool = false) {
           container = NSPersistentContainer(name: "AccountData")
           
           // If using an in-memory store, configure the container to use an in-memory persistent store coordinator.
           if inMemory {
               let description = NSPersistentStoreDescription()
               description.url = URL(fileURLWithPath: "/dev/null")
               container.persistentStoreDescriptions = [description]
           }
           
           // Load the persistent store
           container.loadPersistentStores { (_, error) in
               if let error = error as NSError? {
                   // Handle the error appropriately (e.g., log the error)
                   fatalError("Unresolved error \(error), \(error.userInfo)")
               }
           }
       }

}
