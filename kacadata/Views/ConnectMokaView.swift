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
    
    @ObservedObject
    var viewModel = HomeViewModel()
    @Binding
    var showWebView: Bool
    @State
    var urlString = "https://backoffice.mokapos.com/apps/2000000299/learn-more"
    
    var body: some View {
        NavigationView {
            ZStack {
                WebView(url: URL(string: urlString)!, viewModel: viewModel, showWebView: $showWebView)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
        .navigationBarItems(leading: BackButton(foregroundColor: .primary, title: "Connect"))
    }
}

struct WebView: UIViewRepresentable {
    
    let url: URL
    let viewModel: HomeViewModel
    @Binding
    var showWebView: Bool
    
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
        WebViewCoordinator(self, viewModel: viewModel, showWebView: $showWebView)
    }
    
    class WebViewCoordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        
        var parent: WebView
        var viewModel: HomeViewModel
        @Binding
        var showWebView: Bool
        
        init(_ parent: WebView, viewModel: HomeViewModel, showWebView: Binding<Bool>) {
            self.parent = parent
            self.viewModel = viewModel
            _showWebView = showWebView
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
                if currentUrl.absoluteString.contains(Constant.redirectUri) {
                    let code = currentUrl.absoluteString.components(separatedBy: "code=")[1]
                    viewModel.getToken(code: code)
                    showWebView = false
                }
            }
        }
    }
}
