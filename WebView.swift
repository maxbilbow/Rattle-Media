//
//  WebView.swift
//  Rattle Media
//
//  Created by Max Bilbow on 28/07/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation
import UIKit

class WebView : UIWebView {
    
    
    override func awakeFromNib() {
        println("hello");
        let url = NSURL(string: "https://www.rattlemedia.co.uk");
        self.loadHTMLString("", baseURL: url);
        self.loadRequest(NSURLRequest(URL: url!));
    }
}