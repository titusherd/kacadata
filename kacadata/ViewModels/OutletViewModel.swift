//
//  OutletViewModel.swift
//  kacadata
//
//  Created by Robby Suliantoro on 05/11/22.
//

import SwiftUI
import CoreData

class OutletViewModel: ObservableObject {
    
    // MARK: New Task Properties
    @Published var openListOutlet: Bool = false
    @Published var welcomeOutlet: Bool = false
    @Published var openNewOutlet: Bool = false
    @Published var openEditOutlet: Bool = false
    @Published var openModalDeleteOutlet: Bool = false
    
    @Published var address: String = ""
    @Published var city: String = ""
    @Published var latitude: String = ""
    @Published var longitude: String = ""
    @Published var name: String = ""
    @Published var phoneNumber: String = ""
    @Published var postalCode: String = ""
    
    // MARK: Editing Existing Task Data
    @Published var editOutlet: Outlet2?
    
    // MARK: Adding Task To Core Data
    func addOutlet(context: NSManagedObjectContext)->Bool {
        
        // MARK: Updating Existing Data in Core Data
        var outlet: Outlet2!
        if let editOutlet = editOutlet {
            outlet = editOutlet
        } else {
            outlet = Outlet2(context: context)
        }
        
        outlet.address = address
        outlet.city = city
        outlet.latitude = latitude
        outlet.longitude = longitude
        outlet.name = name
        outlet.phoneNumber = phoneNumber
        outlet.postalCode = postalCode
                
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // MARK: Resetting Data
    func resetOutletData() {
        
        address = ""
        city = ""
        latitude = ""
        longitude = ""
        name = ""
        phoneNumber = ""
        postalCode = ""
        
        editOutlet = nil
    }
    
//    func resetOutletDataDashboard() {
//
//        address = ""
//        city = ""
//        latitude = ""
//        longitude = ""
//        name = ""
//        phoneNumber = ""
//        postalCode = ""
//        haveDashboard = false
//
//        editOutlet = nil
//    }
    
    // MARK: If Edit Task Is Available then Setting Existing Data
    func setupOutlet() {
        if let editOutlet = editOutlet {
            address = editOutlet.address ?? ""
            city = editOutlet.city ?? ""
            latitude = editOutlet.latitude ?? ""
            longitude = editOutlet.longitude ?? ""
            name = editOutlet.name ?? ""
            phoneNumber = editOutlet.phoneNumber ?? ""
            postalCode = editOutlet.postalCode ?? ""
        }
    }
    
//    func setupOutletDashboard() {
//        if let editOutlet = editOutlet {
//            address = editOutlet.address ?? ""
//            city = editOutlet.city ?? ""
//            latitude = editOutlet.latitude ?? ""
//            longitude = editOutlet.longitude ?? ""
//            name = editOutlet.name ?? ""
//            phoneNumber = editOutlet.phoneNumber ?? ""
//            postalCode = editOutlet.postalCode ?? ""
//            haveDashboard = true
//        }
//    }
}
