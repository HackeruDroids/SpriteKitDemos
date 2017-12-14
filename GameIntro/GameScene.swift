//
//  GameScene.swift
//  GameIntro
//
//  Created by hackeru on 19 Kislev 5778.
//  Copyright © 5778 hackeru. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        //mission: 7 min go
        let backs = SKSpriteNode(imageNamed: "back")
        backs.position = CGPoint(x: frame.midX, y: frame.midY)
        backs.size = frame.size
        addChild(backs)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //get the touch position in the views coordinate system.
        let location = touches.first!.location(in: self)
        
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "\(location.x), \(location.y)"
        
        label.position = location//CGPoint(x: frame.midX, y: frame.midY)
        label.fontSize = 7
        addChild(label)
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
