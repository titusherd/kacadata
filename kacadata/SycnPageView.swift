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
                    .frame(width: 378,
                           height: 342,
                           alignment: .bottomLeading)
                    .padding(.bottom, 50.0)
                    .padding(.leading, -16.0)
                
                // MARK: - Text Section
                
                HStack{
//                    (Text("Connecting Data \nWithin Our App ") + Text(image))
                    Text("Connecting Data \nWithin KacaData ")
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
                            .frame(width: 26,
                                   height: 26,
                                   alignment: .center)
                            .foregroundColor(.CustomTeal)
                    }
                }
                .padding(EdgeInsets(top: 0,
                                    leading: -27,
                                    bottom: 20,
                                    trailing: 0))
                
                Text("Integrate your POS data and let us do the rest. \nfind the right marketing strategy for your \nbusiness based on your real data.")
                    .font(.system(size: 16,
                                  weight: .regular,
                                  design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0,
                                        leading: -22,
                                        bottom: 20,
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
                            .background(Color.white)
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                            .font(.system(size: 14,
                                          weight: .semibold,
                                          design: .rounded))
                    }
                )
                .overlay(RoundedRectangle(cornerRadius:8, style: .continuous).stroke(Color.gray, lineWidth: 2))
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
