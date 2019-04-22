//
//  ViewController.swift
//  WKWebView With RefreshControl
//
//  Created by Pawan kumar on 22/04/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webViewContainer: UIView!
    
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        webView = WKWebView(frame: webViewContainer.bounds) // size will be determined by auto-layout
        if let webView = webView {
            webView.translatesAutoresizingMaskIntoConstraints = false
            webViewContainer.addSubview(webView)
            let bindings: [String: AnyObject] = ["webView": webView]
            webViewContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|",
                                                                           options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: bindings))
            webViewContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|",
                                                                           options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: bindings))
            
            let url = URL(string:"https://www.apple.com")
            let request = URLRequest(url:url!)
            webView.load(request)
            
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
            webView.scrollView.addSubview(refreshControl)
            webView.scrollView.bounces = true
        }
    }
    
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        webView?.reload()
        sender.endRefreshing()
    }
}
