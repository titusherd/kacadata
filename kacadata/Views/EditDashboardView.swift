//
//  EditDashboardView.swift
//  kacadata
//
//  Created by Robby Suliantoro on 05/11/22.
//

import SwiftUI

struct EditDashboardView: View {
    
    @EnvironmentObject var dashboardModel: DashboardViewModel
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    @Namespace var animation
    
    @AppStorage("name") var currentOutletName: String?
    @AppStorage("deleteName") var deleteOutletName: String?
    @AppStorage("dashboardName") var currentDashboardName: String?
    @AppStorage("deleteDashboardName") var deleteDashboardName: String?
    
    //@State var bolehEditOutlet: Bool = true
    
    var editDashboardView: some View {
        Group {
            VStack(alignment: .center, spacing:12) {
                
                HStack {
                    Button {
                        
                            env.dismiss()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                
                                //outletModel.openListOutlet = true
                                //outletModel.setupOutlet()
                            }
                    } label: {
                        Text("Cancel")
                            .foregroundColor(Color("aqua"))
                    }
                    Spacer()
                    
                }
                
                Spacer()
                
                Text("")
                    .foregroundColor(.black)
                    .font(.system(size: 36, weight: .bold))
                
                Text("Change the name of your Business")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .regular))

                TextField("Business Name", text: $dashboardModel.name)
                    //.disabled(bolehEditOutlet)
                    .disableAutocorrection(true)
                
                    .multilineTextAlignment(.center)
                    //.foregroundColor(bolehEditOutlet ? .black : .white)
                    .frame(height: 48)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    //.background(bolehEditOutlet ? Color("lightgray"): Color("grayapple"))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                    )
                
                Button {
                    if dashboardModel.addDashboard(context: env.managedObjectContext) {
                        
                        self.dashboardModel.name = self.dashboardModel.name
                        UserDefaults.standard.set(dashboardModel.name, forKey: "dashboardName")
                        
//                        let name: String = $outletModel.name
//                            currentOutletName = name
                        env.dismiss()
                        
                    }
                } label: {
                    Text("Change")
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color.black)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .background(
                            Color("aqua")
                                .cornerRadius(8)
                        )
                }

                Spacer()
                }
            .padding()
        }
    }
    
    
    var body: some View {
        VStack {
            
            editDashboardView
        }
    }
}
