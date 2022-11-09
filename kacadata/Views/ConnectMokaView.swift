//
//  ConnectMokaView.swift
//  kacadata
//
//  Created by Robby Suliantoro on 21/10/22.
//

import SwiftUI
import WebKit

struct ConnectMokaView: View {
    
    // initial URL string
    @State var urlString = "https://backoffice.mokapos.com/apps/2000000285/learn-more"
    
    var body: some View {
        NavigationView {
            ZStack {
                WebView(url: URL(string: urlString)!)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
        .navigationBarItems(leading: BackButton(foregroundColor: .primary, title: "Connect"))
    }
}
 
struct WebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
