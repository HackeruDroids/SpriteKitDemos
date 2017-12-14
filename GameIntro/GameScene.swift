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
        
        addBall()
        addShapes()
    }
    
    
    func addShapes(){
        //circle, triangle, rectangle
        let circle = SKSpriteNode(imageNamed: "circle")
        circle.position = CGPoint(x: 0.25 * size.width, y: size.height - circle.size.height / 2)
        addChild(circle)
        
        let triangle = SKSpriteNode(imageNamed: "triangle")
        triangle.position = CGPoint(x: 0.5 * size.width, y: size.height - circle.size.height / 2)
        addChild(triangle)
        
        let rectangle = SKSpriteNode(imageNamed: "rectangle")
        rectangle.position = CGPoint(x: 0.75 * size.width, y: size.height - circle.size.height / 2)
        addChild(rectangle)
    }
    
    func addBall(){
        let ball = SKSpriteNode(imageNamed: "pokeball")
        ball.position = view!.center
        ball.size = CGSize(width: 35, height: 35)
        ball.name = "ball"
        addChild(ball)
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
