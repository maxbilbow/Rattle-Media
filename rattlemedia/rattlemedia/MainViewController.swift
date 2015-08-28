//
//  TabbedViewController.swift
//  rattlemedia
//
//  Created by Max Bilbow on 28/08/2015.
//  Copyright © 2015 Rattle Media Ltd. All rights reserved.
//

import Foundation
import UIKit
import NotificationCenter
import MediaPlayer
import AVKit


//class TabBarController : UITabBarController {
//    static var instance: UITabBarController?
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        TabBarController.instance = self
//        
//       let mvc = MainViewController()
//        mvc.addChildViewController(self)
//        
//        mvc.tabs = self
//        self.dismissViewControllerAnimated(true) { () -> Void in
//            mvc.loadVideo()
//        }
//        
//    }
//}



class MainViewController : UITabBarController, VideoPlayerDelegate {
    
//    var tabs: UITabBarController!
//    let moviePlayer: MPMoviePlayerViewController = MPMoviePlayerViewController()
    var tabView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.loadVideo()
        VideoPlayer.instance.delegate = self
        VideoPlayer.instance.playFullScreen("Rattle-Square", ofType: "m4v", mode: .ForcedViewing)
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}