//
//  SwiftUIView.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 18/10/22.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 358, height: 382, alignment: .center)
                    .padding()
                
                Text("Connecting Data Within Our App")
                    .font(.system(size: 46, weight: .bold, design: .rounded))
                    .padding()
                
                Text("Connect your data and let our app do the rest. Align your work, and recommend your promo in accurate.")
                    .font(.system(size: 22, weight: .regular, design: .rounded))
                    .padding()
                
                NavigationLink(
                    destination: Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/),
                    label: {
                        Text("Connect With MOKA")
                            .frame(width: 358, height: 48, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                )
                
                NavigationLink(
                    destination: Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/),
                    label: {
                        Text("Import your report file (.csv)")
                            .frame(width: 358, height: 48, alignment: .center)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                )
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
