//
//  DummyDashboard.swift
//  kacadata
//
//  Created by Robby Suliantoro on 21/10/22.
//

import SwiftUI
import Charts

enum AccountType5: String {
    case ayam = "Ayam Bakar Taliwang (Best Seller)"
    case kue = "Kue Putu Maranggi (Worst Seller)"
}

struct Account5: Identifiable {
    let id = UUID()
    let accountType: AccountType5
    let balance: Double
}

struct DummyDashboard: View {
    
    let accounts5 = [
        Account5(accountType: .ayam, balance: 240),
        Account5(accountType: .kue, balance: 68),
    ]
    
    @Binding var isNavigationBarHidden: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                ScrollView{
                    VStack {
                        Rectangle()
                            .fill(.purple)
                            .frame(height:360)
                    }
                    
                    GeometryReader { geo in
                        ZStack{
                            Rectangle()
                                .fill(Color("lightaqua"))
                                .frame(width: geo.size.width - 40, height: geo.size.width * 0.8)
                                .cornerRadius(10)
                                .padding()
                            
                            VStack{
                                HStack {
                                    Text("| Promo Recommendation")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                        .padding(.top, 10)
                                        .padding(.leading)
                                    Spacer()
                                    
                                    NavigationLink(destination: BundleSelection2(isNavigationBarHidden: self.$isNavigationBarHidden))
                                    {
                                        Text("Change Bundle")
                                            .foregroundColor(.black)
                                            .font(.system(size: 11, weight: .bold))
                                            .padding(.top, 10)
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.black)
                                            .padding(.top, 10)
                                            .padding(.trailing)
                                        
                                    }
                                }
                                .padding(.top)
                                
                                Spacer()
                                
                                ZStack {
                                    Chart {
                                        ForEach(accounts5) { account in
                                            BarMark(
                                                x: .value("Balance", account.balance)
                                                ,
                                                y: .value("Account Type", account.accountType.rawValue)
                                            )
                                        }
                                    }
                                    .foregroundColor(Color("aqua"))
                                    .background(
                                        Color("navy")
                                            .cornerRadius(10)
                                    )
                                    .frame(width: geo.size.width - 60, height: geo.size.width * 0.43)
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.bottom)
                                    
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Text("240 Items")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(Color.black)
                                                .padding(.leading,10)
                                                .padding(.bottom,10)
                                            Spacer()
                                        }
                                        Spacer()
                                        HStack {
                                            Text("68 Items")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(Color.black)
                                                .padding(.leading,10)
                                                .padding(.top, 10)
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                    .frame(width: geo.size.width - 60, height: geo.size.width * 0.43)
                                    
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.bottom)
                                }
                                
                                Spacer()
                                
                                NavigationLink(destination: BundleSelection2(isNavigationBarHidden: self.$isNavigationBarHidden)
                                ) {
                                    Text("Schedule Recap")
                                        .font(.headline)
                                        .bold()
                                        .foregroundColor(Color.black)
                                        .frame(width:geo.size.width - 140)
                                        .padding()
                                        .padding(.horizontal, 20)
                                        .background(
                                            Color("aqua")
                                                .cornerRadius(10)
                                        )
                                }
                                .padding(.bottom)
                            }
                            .padding()
                        }
                    }
                    .frame(height: 360)
                    .padding(.bottom)
                }
            }
        }
        .navigationBarTitle("Dashboard")
        .navigationBarBackButtonHidden(true)
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}
