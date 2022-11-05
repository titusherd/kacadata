//
//  ModalDeleteOutletView.swift
//  kacadata
//
//  Created by Robby Suliantoro on 05/11/22.
//

import SwiftUI

struct ModalDeleteOutletView: View {
    
    @EnvironmentObject var outletModel: OutletViewModel
    
    // MARK: Fetching Task
    @FetchRequest(entity: Outlet2.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Outlet2.name, ascending: true)], predicate: nil, animation: .easeInOut) var outlets: FetchedResults<Outlet2>
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    @Namespace var animation
    
    @AppStorage("name") var currentOutletName: String?
    @AppStorage("deleteName") var deleteOutletName: String?
    
    //@State var bolehEditOutlet: Bool = true
    
    var modalDeleteView: some View {
        Group {
            VStack (spacing: 0){
                VStack (spacing: 0){
                    
                    Text("Remove \(deleteOutletName ?? "") ?")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.bottom)
                    
                    Text("Removing your business data will also delete all of your dashboard within that business")
                        .foregroundColor(.black)
                        .font(.system(size: 13, weight: .regular))
                        .multilineTextAlignment(.center)
                }
                
                .padding(.horizontal)
                .frame(width:270, height: 140)
                
                Rectangle()
                    .frame(width:270,height:1)
                    .foregroundColor(.gray)
                
                VStack (spacing: 0){
                    ZStack {
                        
                        Rectangle()
                            .frame(width:1,height:43)
                            .foregroundColor(.gray)
                        
                        
                        HStack {
                            Button {
                                env.dismiss()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    
                                    outletModel.openListOutlet = true
                                    outletModel.setupOutlet()
                                }
                            } label: {
                                Text("Cancel")
                                    .foregroundColor(.black)
                            }
                            .frame(width:135,height:43)
                            
                            
                                Button {
                                    if let editOutlet = outletModel.editOutlet {
                                        env.managedObjectContext.delete(editOutlet)
                                        try? env.managedObjectContext.save()
                                        env.dismiss()
                                    }
                                    outletModel.resetOutletData()
                                    
                                    if (outlets.count) > 0 {
                                        
                                        if (currentOutletName == deleteOutletName) {
                                            
                                            UserDefaults.standard.set(outlets[0].name, forKey: "name")
                                        }
                                    }
                                } label: {
                                    Text("Remove")
                                        .foregroundColor(.red)
                                        .fontWeight(.bold)
                                }
                                .frame(width:135,height:43)
                            
                                
                        }
                    }
                }
                .frame(width:270,height:43)
            }
        }
    }
    
    var body: some View {
        
        VStack (spacing: 0){
            modalDeleteView
        }
        
        .frame(width:270, height: 184)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1.0)
                .foregroundColor(.gray)
        )
        .background(Color.white)
    }
}

