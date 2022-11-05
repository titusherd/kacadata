//
//  ListOutletView.swift
//  kacadata
//
//  Created by Robby Suliantoro on 05/11/22.
//

import SwiftUI

struct ListOutletView: View {
    
    @EnvironmentObject var outletModel: OutletViewModel
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    
    // MARK: Fetching Task
    @FetchRequest(entity: Outlet2.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Outlet2.name, ascending: true)], predicate: nil, animation: .easeInOut) var outlets: FetchedResults<Outlet2>
    
    @State private var showingAlert = false
    
    @AppStorage("name") var currentOutletName: String?
    @AppStorage("deleteName") var deleteOutletName: String?
    
    @Namespace var animation
    
    var body: some View {
        VStack {
            
            ScrollView {
                
                OutletListView()
                
                ZStack {
                    
                    
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color("lightaqua"))
                        .frame(width:354,height:52)
                    
                    HStack {
                        Text("Create New Outlet")
                            .font(.system(size: 17, weight: .regular))
                            .padding()
                        //.frame(width:354,height:52)
                        Spacer()
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 13,height:14)
                            .padding()
                    }
                    Button {
                        env.dismiss()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            outletModel.openNewOutlet.toggle()
                            env.dismiss()
                        }
                    }label: {
                        
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0))
                            .frame(width:354,height:52)
                    }
                }
                .padding(.top)
                
            }
            
        }
        .presentationDetents([.medium, .large])
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
    
    // MARK: TaskView
    @ViewBuilder
    func OutletListView() -> some View {
        LazyVStack(spacing:20) {
            
            ForEach(outlets){outlet in
                OutletListRowView(outlet: outlet)
            }
        }
    }
    
    // MARK: Task Row View
    @ViewBuilder
    func OutletListRowView(outlet: Outlet2) -> some View {
        VStack (alignment: .leading, spacing:10) {
            
            
            ZStack {
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color("aqua"))
                        .frame(width:228,height:52)
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color("aqua"))
                        .frame(width:52,height:52)
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color("aqua"))
                        .frame(width:52,height:52)
                }
                
                HStack {
                    
                    HStack {
                        if (currentOutletName == outlet.name) {
                            
                            Image(systemName: "checkmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16,height:16)
                                .frame(width:52,height:52)
                        } else {
                            
                            Text("")
                                .frame(width:52,height:52)
                        }
                        
                        Text(outlet.name ?? "")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        //.padding()
                        Spacer()
                    }
                    .frame(width:228,height:52)
                    Spacer()
                    
                    Image(systemName: "pencil.line")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16,height:16)
                        .frame(width:52,height:52)
                    Spacer()
                    
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16,height:16)
                        .frame(width:52,height:52)
                    // MARK: Edit Button Only for Non Completed Tasks
                    
                }
                
                HStack {
                    HStack {
                        
                        Button {
                            
                            env.dismiss()
                            outletModel.editOutlet = outlet
                            outletModel.openEditOutlet = true
                            outletModel.setupOutlet()
                            UserDefaults.standard.set(outletModel.name, forKey: "name")
                            outletModel.openEditOutlet = false
                            
                        } label: {
                            Rectangle()
                                .foregroundColor(Color.black.opacity(0))
                        }
                    }
                    .frame(width:228,height:52)
                    
                    Spacer()
                    Button {
                        env.dismiss()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            outletModel.editOutlet = outlet
                            outletModel.openEditOutlet = true
                            outletModel.setupOutlet()
                        }
                    } label: {
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0))
                            .frame(width:52,height:52)
                    }
                    Spacer()
                        Button {
                            env.dismiss()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                
                                outletModel.editOutlet = outlet
                                outletModel.openModalDeleteOutlet = true
                                outletModel.setupOutlet()
                                UserDefaults.standard.set(outletModel.name, forKey: "deleteName")
                            }
                        }
                        
                    label: {
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0))
                            .frame(width:52,height:52)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
