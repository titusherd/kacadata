//
//  ContentView2.swift
//  kacadata
//
//  Created by Robby Suliantoro on 05/11/22.
//

import SwiftUI

struct ContentView2: View {
    
    @StateObject var outletModel: OutletViewModel = .init()
    @StateObject var dashboardModel: DashboardViewModel = .init()
    @Environment(\.self) var env
    
    // MARK: Fetching Task
    @FetchRequest(entity: Outlet2.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Outlet2.name, ascending: true)], predicate: nil, animation: .easeInOut) var outlets: FetchedResults<Outlet2>
    
    // MARK: Fetching Task
    @FetchRequest(entity: Dashboard.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Dashboard.name, ascending: true)], predicate: nil, animation: .easeInOut) var dashboards: FetchedResults<Dashboard>
    
    var body: some View {
        
        NavigationView {
            
            OutletView(outletModel: outletModel, dashboardModel: dashboardModel)
//                .navigationBarTitle("Outlet")
//                .navigationBarTitleDisplayMode(.large)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button("Edit") {
//                            print("Help tapped!")
//                        }
//                    }
//                }
//                .toolbar {
//
//
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//                            outletModel.openNewOutlet.toggle()
//
//                        }label: {
//                            Image(systemName: "plus")
//                                .foregroundColor(Color("aqua"))
//                        }
//                    }
//                }
            
        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView2()
//    }
//}
