//
//  DummySyncDataPage.swift
//  kacadata
//
//  Created by Robby Suliantoro on 21/10/22.
//

import SwiftUI
import SafariServices

struct DummySyncDataPage: View {
    
    
    @State var isNavigationBarHidden: Bool = true
    
    
        // whether or not to show the Safari ViewController
        @State var showSafari = false
        // initial URL string
        @State var urlString = "https://backoffice.mokapos.com/login"
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    
                            Button(action: {
                                // update the URL if you'd like to
                                self.urlString = "https://backoffice.mokapos.com/login"
                                // tell the app that we want to show the Safari VC
                                self.showSafari = true
                            }) {
                                Text("OPEN SAFARI")
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
                            // summon the Safari sheet
                            .fullScreenCover(isPresented: $showSafari) {
                                SafariView(url:URL(string: self.urlString)!)
                            }
                        
                           NavigationLink(destination: AllowSync(isNavigationBarHidden: self.$isNavigationBarHidden)
                           ) {
                               Text("Connect with MOKA")
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
                       }
                
                .navigationBarTitle("Sync Data Page")
                .navigationBarHidden(self.isNavigationBarHidden)
                .onAppear {
                    self.isNavigationBarHidden = true
            }
            }
               }
    }
}


struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}
