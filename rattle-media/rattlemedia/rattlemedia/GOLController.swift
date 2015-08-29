//
//  AppDelegate.swift
//  SKGameOfLife
//
//  Created by Max Bilbow on 07/08/2015.
//  Copyright (c) 2015 Max Bilbow. All rights reserved.
//


import SpriteKit
import UIKit


class GameOfLifeController: UIViewController {
    
//    lazy var skView: SKView = 
    lazy var scene: GameScene! = GameScene(fileNamed:"GameScene")
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.start()

    }
    var ready = false
    func start() {
        if let scene = self.scene {
            let view = SKView(frame: self.view.bounds)
            self.view = view
            scene.scaleMode = .AspectFill
            scene.backgroundColor = UIColor.blackColor();
            scene.setLife();
            view.frameInterval = 10
            
            
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
            
            
            view.addGestureRecognizer(UITapGestureRecognizer(target: scene, action: "onTap:"))
            view.presentScene(scene)
//            view.paused = true
//            scene.paused = true
            ready = true
        }
    }
    
//    func start() {
//        if (ready) {
//            scene?.paused = false
//        } else {
//            prepareToStart()
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.start()
        /* Pick a size for the scene */
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        scene?.paused = true
    }
    
 
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        scene?.paused = false
    }
}
