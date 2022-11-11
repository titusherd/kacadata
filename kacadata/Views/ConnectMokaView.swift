//
//  ConnectMokaView.swift
//  kacadata
//
//  Created by Robby Suliantoro on 21/10/22.
//

import SwiftUI
import WebKit
import SafariServices


struct ConnectMokaView: View {
    
    // initial URL string
    @State var urlString = "https://backoffice.mokapos.com/apps/2000000299/learn-more"
    
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

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
    
}

struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences.allowsContentJavaScript = true
        
        let wkPref = WKWebpagePreferences()
        wkPref.allowsContentJavaScript = true
        
        let prefences = WKPreferences()
        prefences.javaScriptCanOpenWindowsAutomatically = true
        
        config.preferences = prefences
        config.defaultWebpagePreferences = wkPref
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.allowsBackForwardNavigationGestures = true
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self)
    }
    
    class WebViewCoordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            return nil
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if let currentUrl = webView.url {
                print(currentUrl)
            }
        }
    }
}
