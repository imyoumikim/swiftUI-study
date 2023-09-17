//
//  WebViewController.swift
//  swiftUI-sec0-13.webview~
//
//  Created by 김유미 on 2023/09/17.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var url = "https://google.com"
    
    override func viewDidLoad() {
        self.webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: url)!))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webView.evaluateJavaScript("document.title"){ (result, error) in
            self.navigationItem.title = result as? String
            
        }
    }// 웹 뷰가 다 불러지면 호출되는 함수
}
