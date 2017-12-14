//
//  GameViewController.swift
//  GameIntro
//
//  Created by hackeru on 19 Kislev 5778.
//  Copyright © 5778 hackeru. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.frame.size)
        
        guard let v = view as? SKView else{return}
        
        
        scene.scaleMode = .aspectFill
        
        v.showsFPS = true
        v.showsNodeCount = true
        v.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
