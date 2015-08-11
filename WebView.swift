//
//  WebView.swift
//  Rattle Media
//
//  Created by Max Bilbow on 28/07/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class WebView : UIWebView {
    
    
    override func awakeFromNib() {
        print("hello");
        let url = NSURL(string: "https://www.rattlemedia.co.uk");
        self.loadHTMLString("", baseURL: url);
        self.loadRequest(NSURLRequest(URL: url!));
    }
}

class VideoIntro : MPMoviePlayerViewController {
    
    
    override func awakeFromNib() {
    
        var videoPath = NSBundle.mainBundle().pathForResource("../Rattle", ofType: "m4v")
        var videoURL = NSURL.fileURLWithPath(videoPath!)
        
        var moviePlayer = MPMoviePlayerController(contentURL: videoURL!)

//    [moviePlayer.view setFrame:videoView.bounds];
//    [videoView addSubview:moviePlayer.view];
//    
        moviePlayer.prepareToPlay()
        moviePlayer.play();
    
    }
}