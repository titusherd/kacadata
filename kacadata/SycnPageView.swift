//
//  SyncPageView.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 18/10/22.
//

import SwiftUI

struct SyncPageView: View {
    let image = Image(systemName: "questionmark.circle.fill")
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Sync Data Page image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 358, height: 382, alignment: .center)
                    .padding()
                
                HStack{
//                    (Text("Connecting Data \nWithin Our App ") + Text(image))
                    Text("Connecting Data \nWithin Our App ")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.leading)

                    
                    NavigationLink {
                        Text("This is page for Help View")
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 38, height: 38, alignment: .center)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: -17, bottom: 20, trailing: 0))
                
                Text("Connect your data and let our app do the rest. \nAlign your work, and recommend your promo in \naccurate.")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: -17, bottom: 32, trailing: 0))
                
                NavigationLink(
                    destination: Text("This is page for MOKA Sync"),
                    label: {
                        Text("Connect With MOKA")
                            .frame(width: 358, height: 48, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                )
                .padding(.bottom, 4.0)
                
                NavigationLink(
                    destination: Text("Coming Soon!"),
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

struct SyncPageView_Previews: PreviewProvider {
    static var previews: some View {
        SyncPageView()
    }
}
