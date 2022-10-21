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
    
    let results = [
        IdentifiableBundle(menu: "Ayam Bakar Taliwang (Recommended)",quantity: 240, check: true),
        IdentifiableBundle(menu: "Ayam Geprek Taliwang",quantity: 200, check: false),
        IdentifiableBundle(menu: "Ayam Goreng Taliwang",quantity: 188, check: false),
        IdentifiableBundle(menu: "Es Teh Manis",quantity: 160, check: false),
        IdentifiableBundle(menu: "Es Jeruk Manis",quantity: 140, check: false),
        IdentifiableBundle(menu: "Es Campur",quantity: 120, check: false),
        IdentifiableBundle(menu: "Air Es",quantity: 80, check: false),
        IdentifiableBundle(menu: "Kue Pie Bali",quantity: 70, check: false),
        IdentifiableBundle(menu: "Kue Putri Ayu",quantity: 69, check: false),
        IdentifiableBundle(menu: "Kue Putu Maranggi (Recommended)",quantity: 68, check: true),
    ]
    
    
    @Binding var isNavigationBarHidden: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(results) { result in
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 17, style: .continuous)
                                .fill(.white)
                                .frame(height: 83)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .padding(.bottom,13)
                                .shadow(radius: 5)
                            
//                            if (result.check == true) {
//                                RoundedRectangle(cornerRadius: 17, style: .continuous)
//                                    .stroke(Color("aqua"), lineWidth: 4)
//                                    .frame(height: 83)
//                                    .padding(.horizontal)
//                                    .padding(.bottom,13)
//                                    .shadow(radius: 5)
//                            }
                            
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
//                                                .onTapGesture {
//                                                    result.check.toggle()
//                                                }
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
            }
            
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
                            //.shadow(radius: 10)
                        )
                    //.shadow(radius: 10)
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    //                    .padding(.bottom)
                    //                    .padding(.leading)
                    //                    .padding(.trailing)
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
