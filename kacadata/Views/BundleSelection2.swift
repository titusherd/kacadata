//
//  BundleSelection2.swift
//  kacadata
//
//  Created by Robby Suliantoro on 21/10/22.
//

import SwiftUI

struct IdentifiableBundle: Identifiable {
    var id = UUID()
    var menu: String
    var quantity: Int
    var check: Bool
}

struct BundleSelection2: View {
    
    @State var results = [
        IdentifiableBundle(menu: "Ayam Bakar Taliwang (Recommended)",quantity: 240, check: false),
        IdentifiableBundle(menu: "Ayam Geprek Taliwang",quantity: 200, check: false),
        IdentifiableBundle(menu: "Ayam Goreng Taliwang",quantity: 188, check: false),
        IdentifiableBundle(menu: "Es Teh Manis",quantity: 160, check: false),
        IdentifiableBundle(menu: "Es Jeruk Manis",quantity: 140, check: false),
        IdentifiableBundle(menu: "Es Campur",quantity: 120, check: false),
        IdentifiableBundle(menu: "Air Es",quantity: 80, check: false),
        IdentifiableBundle(menu: "Kue Pie Bali",quantity: 70, check: false),
        IdentifiableBundle(menu: "Kue Putri Ayu",quantity: 69, check: false),
        IdentifiableBundle(menu: "Kue Putu Maranggi (Recommended)",quantity: 68, check: false),
    ]
    
    
    @Binding var isNavigationBarHidden: Bool
    
    var trueCount: Int {
        results
            .filter { $0.check == true }
            .count
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    
                    ZStack {
                        
                        VStack {
                            ForEach(results) { result in
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 17, style: .continuous)
                                        .fill(.white)
                                        .overlay(result.check ? RoundedRectangle(cornerRadius: 17).stroke(Color("aqua"), lineWidth:4) : nil)
                                        .frame(height: 83)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                        .padding(.bottom,13)
                                        .shadow(radius: 5)
                                    
                                    VStack (alignment: .leading){
                                        
                                        
                                        HStack {
                                            
                                            Text("\(result.menu)")
                                                .font(.system(size: 11, weight: .bold))
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                        }
                                        .padding(.horizontal)
                                        
                                        ZStack {
                                            
                                            HStack {
                                                
                                                RoundedRectangle(cornerRadius: 17, style: .continuous)
                                                    .fill(Color("aqua"))
                                                    .frame(width: CGFloat(result.quantity), height: 28)
                                                    .padding(.leading)
                                                
                                                Spacer()
                                                
                                                if (result.check == true) {
                                                    Image(systemName: "checkmark.circle.fill")
                                                        .resizable()
                                                        .frame(width: 28, height:28)
                                                        .scaledToFit()
                                                        .foregroundColor(Color("aqua"))
                                                        .padding(.trailing)
                                                }
                                            }
                                            
                                            
                                            HStack {
                                                
                                                Text("\(result.quantity) pcs")
                                                    .font(.system(size: 11, weight: .bold))
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                            .padding(.horizontal)
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 28)
                                        .frame(maxWidth: .infinity)
                                    }
                                    .frame(height: 83)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                                    .padding(.bottom,10)
                                    
                                }
                            }
                        }
                        
                        VStack {
                            ForEach(results.indices) { index in
                                VStack {
                                    
                                    if (trueCount < 2) {
                                        Button(action: { self.results[index].check.toggle() }) {
                                            Text("")
                                                .frame(height: 83)
                                                .frame(maxWidth: .infinity)
                                                .padding(.horizontal)
                                                .padding(.bottom,13)
                                                .shadow(radius: 5)
                                        }
                                    } else {
                                        Button(action: { self.results[index].check = false }) {
                                            Text("")
                                                .frame(height: 83)
                                                .frame(maxWidth: .infinity)
                                                .padding(.horizontal)
                                                .padding(.bottom,13)
                                                .shadow(radius: 5)
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
            
            
            
            VStack {
                if trueCount == 2 {
                    NavigationLink(destination: DummyDashboard(isNavigationBarHidden: self.$isNavigationBarHidden)
                    ) {
                        ZStack {
                            Rectangle()
                                .fill(.white)
                                .ignoresSafeArea(edges: .all)
                                .frame(height: 100)
                                .shadow(radius: 5)
                            
                            Text("Done")
                                .font(.headline)
                                .bold()
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    Color("aqua")
                                        .cornerRadius(10)
                                )
                                .frame(maxWidth: .infinity)
                                .padding()
                            
                        }
                    }
                } else {
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .ignoresSafeArea(edges: .all)
                            .frame(height: 100)
                            .shadow(radius: 5)
                        
                        Text("Done")
                            .font(.headline)
                            .bold()
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                Color(.white)
                                    .cornerRadius(10)
                            )
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth:1))
                        
                            .frame(maxWidth: .infinity)
                            .padding()
                        
                    }
                    
                }
            }
        }
        
        .navigationBarTitle("Bundle Selection")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}
