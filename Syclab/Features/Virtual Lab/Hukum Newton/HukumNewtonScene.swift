//
//  HukumNewtonScene.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 14/11/21.
//

import SpriteKit

class HukumNewtonScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "backgroundvl")
    let firstPlanet = SKSpriteNode(imageNamed: "sun")
    let secondPlanet = SKSpriteNode(imageNamed: "earth")
    
    var distance: CGFloat!
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: size.width, height: size.height)
        addChild(background)
        
        firstPlanet.position = CGPoint(x: size.width * 0.2, y: size.height * 0.3)
        firstPlanet.size = CGSize(width: size.width * 0.15, height: size.width * 0.15)
        addChild(firstPlanet)
        
        secondPlanet.position = CGPoint(x: size.width - (size.width * 0.2), y: size.height * 0.3)
        secondPlanet.size = CGSize(width: size.width * 0.15, height: size.width * 0.15)
        addChild(secondPlanet)
        
        distance = firstPlanet.position.distanceFromCGPoint(point: secondPlanet.position) / 20
        
        setUpDashLine()
    }
    
    func setUpDashLine() {
        let dashLine = SKShapeNode()
        dashLine.name = "dashLine"
        
        let path = CGMutablePath()
        path.addLines(between: [
//            CGPoint(x: firstPlanet.position.x + (firstPlanet.size.width / 2), y: firstPlanet.position.y),
//            CGPoint(x: secondPlanet.position.x - (secondPlanet.size.width / 2), y: secondPlanet.position.y)
            CGPoint(x: firstPlanet.position.x, y: firstPlanet.position.y),
            CGPoint(x: secondPlanet.position.x, y: secondPlanet.position.y)
        ])
        
        let pattern: [CGFloat] = [15.0, 5.0]
        dashLine.path = path.copy(dashingWithPhase: 1, lengths: pattern)
        dashLine.strokeColor = SKColor.white
        dashLine.lineWidth = 2
        addChild(dashLine)
    }
    
    func updateDashLine() {
        guard let dashLine = self.childNode(withName: "dashLine") else { return }
        dashLine.run(SKAction.removeFromParent())
        setUpDashLine()
    }
    
    func updateFirstPlanetMass(previous: Float, current: Float) {
        let result = CGFloat((current - previous) * 10)
        firstPlanet.size.width += result
        firstPlanet.size.height += result
        updateDashLine()
    }
    
    func updateSecondPlanetMass(previous: Float, current: Float) {
        let result = CGFloat((current - previous) * 10)
        secondPlanet.size.width += result
        secondPlanet.size.height += result
        updateDashLine()
    }
    
    func updateDistance(previous: Float, current: Float) {
        let result = CGFloat(CGFloat(current - previous) * distance)
        firstPlanet.position.x -= result
        secondPlanet.position.x += result
        updateDashLine()
    }
}
