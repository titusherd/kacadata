//
//  kacadataApp.swift
//  kacadata
//
//  Created by Ridho Saputra on 11/10/22.
//

import SwiftUI

@main
struct kacadataApp: App {
    
    var body: some Scene {
        WindowGroup {
            SyncDataView(homeVM: HomeViewModel())
        }
    }
}
