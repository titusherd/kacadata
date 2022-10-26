//
//  CoreDataHandler.swift
//  kacadata
//
//  Created by Ridho Saputra on 18/10/22.
//

import Foundation
import CoreData

struct CoreDataHandler {
    var context = PersistenceController.shared.container.viewContext
    
    func addDocument(title: String, location: String, url: String, size: String) -> Document? {
        if(!title.isEmpty) {
            let docToBeAdded = Document(context: context)
            docToBeAdded.name = title
            docToBeAdded.location = location
            docToBeAdded.url = url
            docToBeAdded.date = Date()
            docToBeAdded.size = size
            save()
            return docToBeAdded
        }
        return nil
    }
    
    func listOfDocuments() -> [Document] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Document")
        var items = [Document]()
        do {
            items = try context.fetch(fetchRequest) as! [Document]
        }
        catch {
            print(error)
        }
        return items
    }
    
    func deleteDocument(doc: Document) {
        context.delete(doc)
        save()
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                print(error)
            }
        }
    }
}
