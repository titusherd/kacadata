//
//  SwiftUIView.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 18/10/22.
//

import SwiftUI

struct SwiftUIView: View {
    let image = Image(systemName: "questionmark.circle.fill")
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Sync Data Page image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 358, height: 382, alignment: .center)
                    .padding()
                
                (Text("Connecting Data \nWithin Our App ") + Text(image))
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: -38, bottom: 20, trailing: 0))
                
                Text("Connect your data and let our app do the rest. \nAlign your work, and recommend your promo in accurate.")
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 40, trailing: 36))
                
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
