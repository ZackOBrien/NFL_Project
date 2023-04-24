//
//  WebView.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/24/22.
// 

import SwiftUI

import WebKit

struct MyWebView: UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct WebView: View {
    var url_string: String
    
    var body: some View {
        if let url_add = URL(string: url_string) {
            MyWebView(request: URLRequest(url: url_add))
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url_string: "https://www.azcardinals.com/")
    }
}
