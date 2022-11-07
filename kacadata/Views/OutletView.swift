//
//  OutletView.swift
//  kacadata
//
//  Created by Robby Suliantoro on 05/11/22.
//

import SwiftUI

struct OutletView: View {
    
    
    @StateObject var outletModel: OutletViewModel
    @StateObject var dashboardModel: DashboardViewModel
    
    // MARK: Matched Geometry Namespace
    @Namespace var animation
    
    // MARK: Fetching Task
    @FetchRequest(entity: Outlet2.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Outlet2.name, ascending: true)], predicate: nil, animation: .easeInOut) var outlets: FetchedResults<Outlet2>
    
    // MARK: Fetching Task
    @FetchRequest(entity: Dashboard.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Dashboard.name, ascending: true)], predicate: nil, animation: .easeInOut) var dashboards: FetchedResults<Dashboard>
    
    @State var isNavigationBarHidden: Bool = true
    
    @AppStorage("name") var currentOutletName: String?
    @AppStorage("deleteName") var deleteOutletName: String?
    @AppStorage("dashboardName") var currentDashboardName: String?
    @AppStorage("deleteDashboardName") var deleteDashboardName: String?
    
    // MARK: Environment Values
    @Environment(\.self) var env
    
    var body: some View {
        NavigationStack {
            
            if outlets.count == 0 {
                VStack{
                    Text("")
                }
                .navigationBarHidden(true)
                
                .onAppear(){
                    if outlets.count == 0 {
                        
                        outletModel.welcomeOutlet = true
                    }
                }
                .fullScreenCover(isPresented: $outletModel.welcomeOutlet) {
                    outletModel.resetOutletData()
                } content: {
                    //AddNewOutlet()
                    WelcomeView()
                        .environmentObject(outletModel)
                }
            } else {
                VStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Edit")
                                .foregroundColor(Color("lightgray"))
                                .padding(.leading, 16)
                        }
                        Spacer()
                        
                        Button {
                            
                            dashboardModel.openNewDashboard = true
                        }label : {
                            Image(systemName: "plus")
                                .foregroundColor(Color("aqua"))
                                .padding(.trailing, 16)
                        }
                    }
                    HStack {
                        OutletView()
                    }.padding()
                    
                    //                if (dashboards.count == 0 ) {
                    //                    Spacer()
                    //
                    //                    VStack {
                    //                                            Rectangle()
                    //                                                .frame(width:136,height:145)
                    //                                                .padding(.bottom,16)
                    //                                            // MARK: Cust View
                    //                                            //OutletView()
                    //                                            Text("No Data")
                    //                                                .frame(width: 218)
                    //                                                .font(.system(size: 28, weight: .bold))
                    //                                            Text("You haven’t start any analytics upon this business yet, would you like to start one by connecting your POS data with us ?")
                    //                                                .frame(width: 218)
                    //                                                .multilineTextAlignment(.center)
                    //                                                .font(.system(size: 16, weight: .regular))
                    //                                                .padding(.bottom, 16)
                    //                                            Button {
                    //                                                dashboardModel.openNewDashboard = true
                    //
                    //                                            }label: {
                    //                                                Text("Connect Now")
                    //                                                    .frame(width: 218)
                    //                                                    .foregroundColor(Color("aqua"))
                    //                                                    .font(.system(size: 16, weight: .regular))
                    //                                            }
                    //                                        }
                    //                                        .padding(.top, 0)
                    //                                        .padding(.bottom, 0)
                    //                                        .padding(.leading, 16)
                    //                                        .padding(.trailing, 16)
                    //
                    //
                    //                    Spacer()
                    //                } else {
                    //
                    ScrollView {
                        DashboardView().padding(.horizontal)
                    }
                    //}
                    
                }
                .fullScreenCover(isPresented: $outletModel.openNewOutlet) {
                    outletModel.resetOutletData()
                } content: {
                    AddNewOutletView()
                        .environmentObject(outletModel)
                }
                .sheet(isPresented: $outletModel.openListOutlet
                       // , onDismiss:  {outletModel.openEditOutlet = true}
                ) {
                    outletModel.resetOutletData()
                } content: {
                    ListOutletView()
                        .environmentObject(outletModel)
                }
                .fullScreenCover(isPresented: $outletModel.openEditOutlet) {
                    outletModel.resetOutletData()
                } content: {
                    EditOutletView()
                        .environmentObject(outletModel)
                }
                .fullScreenCover(isPresented: $outletModel.openModalDeleteOutlet) {
                    outletModel.resetOutletData()
                } content: {
                    ZStack {
                        ModalDeleteOutletView()
                            .environmentObject(outletModel)
                    }
                    .background(TransparentBackground())
                }
                
                .fullScreenCover(isPresented: $dashboardModel.openNewDashboard) {
                    dashboardModel.resetDashboardData()
                } content: {
                    AddNewDashboardView()
                        .environmentObject(dashboardModel)
                }
                
                .fullScreenCover(isPresented: $dashboardModel.openModalDeleteDashboard) {
                    dashboardModel.resetDashboardData()
                } content: {
                    ZStack {
                        ModalDeleteDashboardView()
                            .environmentObject(dashboardModel)
                    }
                    .background(TransparentBackground())
                }
                
                
                //.navigationBarTitle("\(currentOutletName ?? "")")
                .navigationBarHidden(self.isNavigationBarHidden)
                //.navigationBarHidden(true)
                .onAppear {
                    self.isNavigationBarHidden = true
                }
                
            }
        }
        .environmentObject(outletModel)
        .environmentObject(dashboardModel)
    }
    
    // MARK: TaskView
    @ViewBuilder
    func OutletView() -> some View {
        LazyVStack(spacing:20) {
            ZStack {
                HStack {
                    Text(currentOutletName ?? "")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()
                }
                Button {
                    //outletModel.editOutlet = outlet
                    outletModel.openListOutlet = true
                    outletModel.setupOutlet()
                    //OutletListView()
                } label: {
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0))
                }
            }
        }
    }
    
    
    // MARK: TaskView
    @ViewBuilder
    func DashboardView() -> some View {
        LazyVStack(spacing:20) {
            
            ZStack {
                
                //ScrollView{
                
                VStack {
                    ForEach(dashboards){dashboard in
                        DashboardRowView(dashboard: dashboard)
                    }
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundColor(Color("aqua"))
                            .frame(width:358,height:83)
                        
                        
                        HStack {
                            Text("Create New Dashboard")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.black)
                        }
                        .frame(width:358,height:83)
                        
                        HStack {
                            
                            Button {
                                dashboardModel.openNewDashboard = true
                            } label: {
                                Rectangle()
                                    .foregroundColor(Color.black.opacity(0))
                            }
                        }
                        .frame(width:358,height:83)
                    }
                    .padding(.top,4)
                }
                //}
                
                
                //                VStack {
                //
                //                    Spacer()
                //
                //                    VStack {
                //                        Rectangle()
                //                            .frame(width:136,height:145)
                //                            .padding(.bottom,16)
                //                        // MARK: Cust View
                //                        //OutletView()
                //                        Text("No Data")
                //                            .frame(width: 218)
                //                            .font(.system(size: 28, weight: .bold))
                //                        Text("You haven’t start any analytics upon this business yet, would you like to start one by connecting your POS data with us ?")
                //                            .frame(width: 218)
                //                            .multilineTextAlignment(.center)
                //                            .font(.system(size: 16, weight: .regular))
                //                            .padding(.bottom, 16)
                //                        Button {
                //                            //outletModel.openNewOutlet.toggle()
                //
                //                        }label: {
                //                            Text("Connect Now")
                //                                .frame(width: 218)
                //                                .foregroundColor(Color("aqua"))
                //                                .font(.system(size: 16, weight: .regular))
                //                        }
                //                    }
                //                    .padding(.top, 0)
                //                    .padding(.bottom, 0)
                //                    .padding(.leading, 16)
                //                    .padding(.trailing, 16)
                //
                //                    Spacer()
                //                }
                //                .opacity(dashboards.isEmpty ? 1.0 : 0.0)
            }
            
            //                        ForEach(dashboards){dashboard in
            //                            DashboardRowView(dashboard: dashboard)
            //                        }
        }
    }
    
    // MARK: Task Row View
    @ViewBuilder
    func DashboardRowView(dashboard: Dashboard) -> some View {
        VStack (alignment: .leading, spacing:10) {
            
            
            if (currentOutletName == dashboard.outletName) {
                
                ZStack {
                    
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundColor(Color("aqua"))
                            .frame(width:278,height:83)
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundColor(Color("aqua"))
                            .frame(width:64,height:83)
                    }
                    
                    HStack {
                        
                        VStack {
                            Spacer()
                            HStack {
                                
                                Text(dashboard.name ?? "")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("PERIOD : ")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                Spacer()
                            }
                            Spacer()
                        }
                        .frame(width:278,height:83)
                        Spacer()
                        
                        Image(systemName: "trash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16,height:16)
                            .frame(width:64,height:83)
                        // MARK: Edit Button Only for Non Completed Tasks
                        
                    }
                    
                    HStack {
                        HStack {
                            //
                            NavigationLink(destination: AllowSync(isNavigationBarHidden: self.$isNavigationBarHidden
                                                                  
                                                                  //, UserDefaults.standard.set(dashboardModel.name, forKey: "deleteDashboardName")
                                                                  //, outletModel: outletModel, dashboardModel: dashboardModel
                                                                 )
                                .onAppear {
                                    
                                    dashboardModel.editDashboard = dashboard
                                    dashboardModel.openEditDashboard = true
                                    dashboardModel.setupDashboard()
                                    UserDefaults.standard.set(dashboardModel.name, forKey: "currentDashboardName")
                                    dashboardModel.openEditDashboard = false
                                }
                            )
                            {
                                Rectangle()
                                    .foregroundColor(Color.black.opacity(0))
                                //                                        .simultaneousGesture(TapGesture().onEnded{
                                //
                                //                                            dashboardModel.editDashboard = dashboard
                                //                                            dashboardModel.openEditDashboard = true
                                //                                            dashboardModel.setupDashboard()
                                //                                            UserDefaults.standard.set(dashboardModel.name, forKey: "currentDashboardName")
                                //                                            dashboardModel.openEditDashboard = false
                                //                                        })
                            }
                            
                            //                            Button {
                            //
                            //                            } label: {
                            //                                Rectangle()
                            //                                    .foregroundColor(Color.black.opacity(0))
                            //                            }
                        }
                        .frame(width:278,height:83)
                        Spacer()
                        Button {
                            
                            dashboardModel.editDashboard = dashboard
                            dashboardModel.openModalDeleteDashboard = true
                            dashboardModel.setupDashboard()
                            UserDefaults.standard.set(dashboardModel.name, forKey: "deleteDashboardName")
                            //}
                        }
                        
                    label: {
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0))
                            .frame(width:64,height:83)
                    }
                    }
                }
            } else {
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}


struct TransparentBackground: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

