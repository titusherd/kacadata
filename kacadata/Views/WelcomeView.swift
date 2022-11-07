//
//  WelcomeView.swift
//  kacadata
//
//  Created by Robby Suliantoro on 05/11/22.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var outletModel: OutletViewModel
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    @Namespace var animation
    
    @AppStorage("name") var currentOutletName: String?
    
    //@State var bolehEditOutlet: Bool = true
    
    var welcomeOutlet: some View {
        Group {
            VStack(alignment: .center, spacing:12) {
                
                Text("Welcome,")
                    .foregroundColor(.black)
                    .font(.system(size: 36, weight: .bold))
                
                Text("let us know your business name.")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .regular))

                TextField("Business Name", text: $outletModel.name)
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
                    if outletModel.addOutlet(context: env.managedObjectContext) {
                        
                        self.outletModel.name = self.outletModel.name
                        UserDefaults.standard.set(outletModel.name, forKey: "name")
                        
//                        let name: String = $outletModel.name
//                            currentOutletName = name
                        env.dismiss()
                        
                    }
                } label: {
                    Text("Create")
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

                
                }
            .padding()
        }
    }
    
    
    var body: some View {
        VStack {
            
            welcomeOutlet
        }
    }
}

