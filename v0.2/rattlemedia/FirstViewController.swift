//
//  FirstViewController.swift
//  rattlemedia
//
//  Created by Max Bilbow on 28/07/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation

import UIKit


class WebViewController : UIViewController {
    
    var webview = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = self.webview
        webview.allowsInlineMediaPlayback = true
        webview.dataDetectorTypes = UIDataDetectorTypes.All
        webview.mediaPlaybackAllowsAirPlay = true
        webview.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
    }
    
    func loadURL(url string: String) {
        if let url = NSURL(string: string) {
            
            let request = NSURLRequest(URL: url)
            
            webview.loadHTMLString("", baseURL: url)
            webview.loadRequest(request)
        }
    }
    func http(var url string: String) {
        if !string.hasPrefix("http://") {
            string = "http://\(string)"
        }
        self.loadURL(url: string)
    }
    
    func https(var url string: String) {
        if !string.hasPrefix("https://") {
            if (string.hasPrefix("http://")) {
                string = NSString(string: string).substringFromIndex(7)
            }
            string = "https://\(string)"
        }
        self.loadURL(url: string)
    }
}
class FirstViewController: WebViewController {

    
    @IBOutlet var webView: UIWebView!// = UIWebView()
   
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.http(url: "2015.rattlemedia.co.uk")

        
    }


    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

