//
//  DashboardViewModel.swift
//  kacadata
//
//  Created by Robby Suliantoro on 05/11/22.
//

import SwiftUI
import CoreData

class DashboardViewModel: ObservableObject {
    
    // MARK: New Task Properties
    @Published var openNewDashboard: Bool = false
    @Published var openEditDashboard: Bool = false
    @Published var openModalDeleteDashboard: Bool = false
    
    @Published var name: String = ""
    @Published var outletName: String = ""
    
    @AppStorage("name") var currentOutletName: String?
    
    // MARK: Editing Existing Task Data
    @Published var editDashboard: Dashboard?
    
    // MARK: Adding Task To Core Data
    func addDashboard(context: NSManagedObjectContext)->Bool {
        
        // MARK: Updating Existing Data in Core Data
        var dashboard: Dashboard!
        if let editDashboard = editDashboard {
            dashboard = editDashboard
        } else {
            dashboard = Dashboard(context: context)
        }
        
        dashboard.name = name
        dashboard.outletName = currentOutletName
                
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // MARK: Resetting Data
    func resetDashboardData() {
        
        name = ""
        outletName = ""
        
        editDashboard = nil
    }
    
    // MARK: If Edit Task Is Available then Setting Existing Data
    func setupDashboard() {
        if let editDashboard = editDashboard {
            name = editDashboard.name ?? ""
            outletName = editDashboard.outletName ?? ""
        }
    }
}

