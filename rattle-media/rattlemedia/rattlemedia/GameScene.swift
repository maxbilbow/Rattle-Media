//
//  GameScene.swift
//  GameOfLifeSprite
//
//  Created by Max Bilbow on 02/07/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import SpriteKit
import SceneKit
class GameScene: SKScene {
    
    private var life: Life?
    var cells: [[GameOfLifeNode]] = [[GameOfLifeNode]]()
    
  
    
    func reviveNodeAndNeighbours(node: GameOfLifeNode, oneIn chance: Int = 2) {
        self.life?.a.set(node.ref.x, y: node.ref.y, b: true)
        node.update()
        if let x: Int = node.ref.x - 1 where x > 0 {
            if random() % chance == 1 {
                self.life?.a.set(x, y: node.ref.y, b: true)
            }
        }
        if let x: Int = node.ref.x + 1 where x <= self.life?.w {
            if random() % chance == 1 {
                self.life?.a.set(x, y: node.ref.y, b: true)
            }
        }
        if let y: Int = node.ref.y - 1 where y > 0 {
            if random() % chance == 1 {
                self.life?.a.set(node.ref.x, y: y, b: true)
            }
        }
        if let y: Int = node.ref.y + 1 where y <= self.life?.h {
            if random() % chance == 1 {
                self.life?.a.set(node.ref.x, y: y, b: true)
            }
        }
        if let x: Int = node.ref.x + 1 where x <= self.life?.w, let y: Int = node.ref.y + 1 where y <= self.life?.h {
            if random() % chance == 1 {
                self.life?.a.set(x, y: y, b: true)
            }
        }
        if let x: Int = node.ref.x - 1 where x > 0, let y: Int = node.ref.y - 1 where y > 0 {
            if random() % chance == 1 {
                self.life?.a.set(x, y: y, b: true)
            }
        }
        if let x: Int = node.ref.x + 1 where x <= self.life?.w, let y: Int = node.ref.y - 1 where y > 0 {
            if random() % chance == 1 {
                self.life?.a.set(x, y: y, b: true)
            }
        }
        if let x: Int = node.ref.x - 1 where x > 0, let y: Int = node.ref.y + 1 where y <= self.life?.h {
            if random() % chance == 1 {
                self.life?.a.set(x, y: y, b: true)
            }
        }
        node.update()
    }
    
    func onTap(tap: UIGestureRecognizer) {
        /* Called when a mouse click occurs */
        
        let location = self.convertPointFromView(tap.locationInView(tap.view))
//        print(location)
        if let node = nodeAtPoint(location).parent as? GameOfLifeNode ?? nodeAtPoint(location) as? GameOfLifeNode {
            self.reviveNodeAndNeighbours(node)
        }
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if let life = self.life {
            life.step()
            for row in self.cells {
                for cell in row {
                    cell.update()
                }
            }
        }
    }
    
    func setLife(shape: GameOfLifeNode.Shape = .Square) {
        let bounds = self.size
        let radius: CGFloat = 10
        self.life = Life.new(bounds.width / radius, height: bounds.height / radius)
        
        for var y = 0; y < self.life?.h; ++y {
            self.cells.append([GameOfLifeNode]())
            for var x = 0; x < self.life?.w; ++x {
                self.cells[y].append(GameOfLifeNode(life: self.life!, x: x, y: y, radius: radius, shape: shape).addToScene(self))
                
            }
        }
    }
}
