//
//  AllowSync.swift
//  kacadata
//
//  Created by Robby Suliantoro on 21/10/22.
//

import SwiftUI

struct AllowSync: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @Binding var isNavigationBarHidden: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                TextField("Username", text: $username)
                    .frame(height: 48)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                    )
                SecureField("Password", text: $password)
                    .frame(height: 48)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                    )
                NavigationLink(destination: DummyDashboard(isNavigationBarHidden: self.$isNavigationBarHidden)
                ) {
                    Text("Submit Dashboard")
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width:250)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(
                            Color.blue
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        )
                        .shadow(radius: 10)
                }
                Spacer()
            }.padding()
        }
        
        .navigationBarTitle("Allow Sync")
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

