//
//  VideoPlayer.swift
//  rattlemedia
//
//  Created by Max Bilbow on 28/08/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation
import AVKit
import UIKit
import MediaPlayer

protocol VideoPlayerDelegate {
    var view: UIView! { get set }
}
class VideoPlayer : MPMoviePlayerViewController  {
    static let instance = VideoPlayer()
    
    var delegate: VideoPlayerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //            self.view.addSubview(moviePlayer.view)//mpc.view
        
    }
    enum Mode {
        case ForcedViewing, Default
    }
    
    func setMode(mode: Mode) {
        switch mode {
        case .ForcedViewing:
            moviePlayer.backgroundView.backgroundColor = UIColor.whiteColor()
            moviePlayer.controlStyle = MPMovieControlStyle.None
            moviePlayer.scalingMode = MPMovieScalingMode.AspectFit
            break;
        default:
            moviePlayer.backgroundView.backgroundColor = UIColor.whiteColor()
            moviePlayer.controlStyle = MPMovieControlStyle.Default
            moviePlayer.scalingMode = MPMovieScalingMode.AspectFit
            break;
        }
    }
    
    func playFullScreen(name: String, ofType type: String, mode: Mode? = nil) {
        
        if let videoPath = NSBundle.mainBundle().pathForResource(name, ofType: type) {
            if let mode = mode {
                self.setMode(mode)
            }
            let viewTemp = self.delegate?.view
            self.delegate?.view = self.moviePlayer.view
            
       
            let videoURL = NSURL.fileURLWithPath(videoPath)
            
            
           
    
            NSNotificationCenter.defaultCenter().addObserverForName(MPMoviePlayerPlaybackDidFinishNotification, object: nil, queue: nil, usingBlock: { (n) -> Void in
                self.delegate?.view = viewTemp
                self.setMode(.Default)
//
            })
            
            
            

            moviePlayer.view.backgroundColor = UIColor.whiteColor()
            moviePlayer.contentURL = videoURL
            moviePlayer.prepareToPlay()
            
            moviePlayer.play()
            
            
        } else {
            NSLog("Cound not load video");
//            notificationCenter.postNotificationName(MPMoviePlayerPlaybackDidFinishNotification, object: self)
        }
        
    }
    
    
    
    
    
}