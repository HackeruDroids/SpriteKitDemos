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
    
    //001 // 2^0
    //010 // 2^1
    //100 // 2^2
    //1, 2, 4, 8, 16, 32, 64
    let BallCategory: UInt32 = 1 << 0  // 1 // 0b0000000000010000
    let BrickCategory: UInt32 = 0b10 //2
    let FloorCategory: UInt32 = 1 << 2//0b100 //4
    
    override func didMove(to view: SKView) {
        //mission: 7 min go
        let backs = SKSpriteNode(imageNamed: "back")
        backs.position = CGPoint(x: frame.midX, y: frame.midY)
        backs.size = frame.size
        addChild(backs)
        addPaddle()
        addFloor()
        addBall()
        
        //addShapes()
        addBricks()
       
        cageTheBall()
    }
    func addFloor(){
        let floor = SKNode()
        let paddle = childNode(withName: "paddle")!
        floor.name = "floor" //childNode(with:...)
    
        let y = paddle.position.y - paddle.frame.size.height / 2
        let bottomRect = CGRect(x: 0, y: y, width: size.width, height: 1)
        
        floor.physicsBody = SKPhysicsBody(edgeLoopFrom: bottomRect)
        floor.physicsBody?.categoryBitMask = FloorCategory
        addChild(floor)
    }
    func addBricks(){
        //add 8 bricks to the top center of the view
        let brick = SKSpriteNode(imageNamed: "block")
        brick.size.width = brick.size.width / 5
        brick.size.height = brick.size.height / 5
 
        let w = brick.size.width
        let h = brick.size.height
        let n = 8
        let vWidth = size.width
        let vHeight = size.height
 
        var left = (vWidth - CGFloat(n) * w) * 0.5
        
        for _ in 0...n{
            let b = SKSpriteNode(imageNamed: "block")
            b.size = brick.size
            b.physicsBody = SKPhysicsBody(rectangleOf: b.size)
            b.name = "brick"
            b.physicsBody?.categoryBitMask = BrickCategory //2
            b.physicsBody?.isDynamic = false
            b.position = CGPoint(x: left, y: vHeight - h)
            
            addChild(b)
            left += w
        }
    }
    func addPaddle(){
        let paddle = SKSpriteNode(imageNamed: "paddle")
        paddle.name = "paddle" //id
        paddle.position = CGPoint(x: frame.midX, y: 0 + paddle.size.height * 3)
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
        paddle.physicsBody?.isDynamic = false
        addChild(paddle)
    }
    
    func addShapes(){
        //circle, triangle, rectangle
        let circle = SKSpriteNode(imageNamed: "circle")
        circle.name = "circle"
        circle.position = CGPoint(x: 0.25 * size.width, y: size.height - circle.size.height / 2)
        circle.physicsBody = SKPhysicsBody(circleOfRadius: circle.size.height / 2)
        
        
        addChild(circle)
        
        let triangle = SKSpriteNode(imageNamed: "triangle")
        triangle.name = "trianlge"
        triangle.position = CGPoint(x: 0.5 * size.width, y: size.height - circle.size.height / 2)
        triangle.physicsBody = SKPhysicsBody(texture: triangle.texture!, size: triangle.size)
        addChild(triangle)
        
        let rectangle = SKSpriteNode(imageNamed: "rectangle")
        rectangle.name = "rectangle"
        rectangle.position = CGPoint(x: 0.75 * size.width, y: size.height - circle.size.height / 2)
        rectangle.physicsBody = SKPhysicsBody(rectangleOf: rectangle.size)
        addChild(rectangle)
    }
    
    func cageTheBall(){
        let worldBody = SKPhysicsBody(edgeLoopFrom: frame)
        worldBody.friction = 0
        worldBody.isDynamic = false //vs static
        self.physicsWorld.gravity = CGVector.zero
        self.physicsBody  = worldBody
    }
    func addBall(){
        let ball = SKSpriteNode(imageNamed: "pokeball")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.height / 2)
        ball.physicsBody?.allowsRotation = false //
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.categoryBitMask = BallCategory
        ball.position = view!.center
        ball.size = CGSize(width: 35, height: 35)
        ball.name = "ball"
        addChild(ball)
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 40, dy: 40))
    }
    
    var isFingerOnPaddle = false
    //is the finger on the paddle?
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        let point = touches.first!.location(in: self) //location in scene
        
        //find node by name
        let pad = childNode(withName: "paddle")!
        
        //isFingerOnPaddle?
        isFingerOnPaddle = pad.frame.contains(point)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isFingerOnPaddle else {return}
       
        
        //is the finger on the paddle?
        let point = touches.first!.location(in: self) //location in scene
        
        //find node by name
        let pad = childNode(withName: "paddle")!
        
        pad.position.x = point.x
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnPaddle = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnPaddle = false
    }
    
    
    func addLabel(_ touches: Set<UITouch>){
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
