//
//  WebViewController.swift
//  swiftUI-sec0-14.jsbridge
//
//  Created by 김유미 on 2023/09/18.
//

import Foundation
import WebKit

class WebViewController: UIViewController, WKScriptMessageHandler {
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "iPhoneInfo")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        
        webView = WKWebView(frame: self.view.bounds, configuration: configuration)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        self.view.addSubview(webView)
        
        let localFile = Bundle.main.path(forResource: "TestWeb", ofType: "html")
        let url = URL(fileURLWithPath: localFile!)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "iPhoneInfo" {
            print("call native")
        }
    }
}

extension WebViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: "js test", message: message, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler()
        }
        
        alertController.addAction(doneAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("showAlert('hi')", completionHandler: nil)
    }
}
