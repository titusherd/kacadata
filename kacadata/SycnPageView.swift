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
            // MARK: - Image Section

            VStack {
                Image("Asset cable1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 358,
                           height: 342,
                           alignment: .bottomLeading)
                    .padding(.bottom, 50.0)
                    .padding(.leading, -32.0)
                
                // MARK: - Text Section
                
                HStack{
//                    (Text("Connecting Data \nWithin Our App ") + Text(image))
                    Text("Connecting Data \nWithin Our App ")
                        .font(.system(size: 36,
                                      weight: .bold,
                                      design: .rounded))
                        .multilineTextAlignment(.leading)

                    
                    NavigationLink {
                        Text("This is page for Help View")
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 38,
                                   height: 38,
                                   alignment: .center)
                            .foregroundColor(.CustomTeal)
                    }
                }
                .padding(EdgeInsets(top: 0,
                                    leading: -17,
                                    bottom: 20,
                                    trailing: 0))
                
                Text("Connect your data and let our app do the rest. \nAlign your work, and recommend your promo in \naccurate.")
                    .font(.system(size: 16,
                                  weight: .regular,
                                  design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0,
                                        leading: -17,
                                        bottom: 32,
                                        trailing: 0))
                
                // MARK: - Button Section
                
                NavigationLink(
                    destination: Text("This is page for MOKA Sync"),
                    label: {
                        Text("Connect Using MOKA")
                            .frame(width: 358,
                                   height: 48,
                                   alignment: .center)
                            .background(Color.CustomTeal)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            .font(.system(size: 14,
                                          weight: .semibold,
                                          design: .rounded))
                    }
                )
                .padding(.bottom, 4.0)
                
                NavigationLink(
                    destination: Text("Coming Soon!"),
                    label: {
                        Text("Import your report file (.csv)")
                            .frame(width: 358,
                                   height: 48,
                                   alignment: .center)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .font(.system(size: 14,
                                          weight: .semibold,
                                          design: .rounded))
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

//extension Color {
//    static let CustomTeal = Color("CustomTeal")
//    static let CustomBlack = Color("CustomBlack")
//    static let CustomDarkTeal = Color("CustomDarkTeal")
//    static let CustomDarkTeal2 = Color("CustomDarkTeal2")
//    static let CustomLightTeal = Color("CustomLightTeal")
//    static let CustomOrange = Color("CustomOrange")
//}
