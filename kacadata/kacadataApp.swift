//
//  kacadataApp.swift
//  kacadata
//
//  Created by Ridho Saputra on 11/10/22.
//

import SwiftUI

@main
struct kacadataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
