//
//  WebView.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 07.05.23.
//

import SwiftUI
import WebKit


struct HTMLView: UIViewRepresentable {
	let htmlContent: String
	let headerString = "<head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></head>"


	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}

	func updateUIView(_ uiView: WKWebView, context: Context) {
		uiView.loadHTMLString("\(headerString) <body>\(htmlContent)</body>", baseURL: nil)
	}
}
