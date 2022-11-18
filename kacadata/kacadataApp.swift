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
            ZStack {
                let data = KeychainHelper.standard.read() ?? Data("".utf8)
                let accessToken = String(data: data, encoding: .utf8)!

                if !accessToken.isEmpty {
                    DashboardOverview()
                } else {
                    SyncDataView(homeVM: HomeViewModel())
                }
            }
        }
    }
}
