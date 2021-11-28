//
//  HukumNewtonSceneExtension.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 28/11/21.
//

import SpriteKit

extension HukumNewtonScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if modeOption == .Misi {
            let crash = SKSpriteNode(imageNamed: "Bertabrakan")
            crash.name = "crash"
            crash.size = CGSize(width: size.width * 0.15, height: size.width * 0.15)
            crash.position = CGPoint(x: size.width/2, y: size.height * 0.3)
            addChild(crash)
            
            run(SKAction.playSoundFileNamed("tabrak1s.mp3", waitForCompletion: false))
        }
    }
}
