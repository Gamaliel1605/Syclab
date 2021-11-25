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
    var previousPostition: (firstPlanet: CGPoint, SecondPlanet: CGPoint)!
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: size.width, height: size.height)
        addChild(background)
        
        firstPlanet.position = CGPoint(x: size.width * 0.2, y: size.height * 0.3)
        firstPlanet.size = CGSize(width: size.width * 0.15, height: size.width * 0.15)
        addChild(firstPlanet)
        
        secondPlanet.position = CGPoint(x: size.width - (size.width * 0.2), y: size.height * 0.3)
        secondPlanet.size = CGSize(width: size.width * 0.15, height: size.width * 0.15)
        rotation(secondPlanet)
        addChild(secondPlanet)
        
        distance = firstPlanet.position.distanceFromCGPoint(point: secondPlanet.position) / 20
        
        setUpDashLine()
    }
    
    func reset() {
        firstPlanet.position = previousPostition.firstPlanet
        secondPlanet.position = previousPostition.SecondPlanet
//        firstPlanet.position.y += 100
//        secondPlanet.position.y -= 100
        setUpDashLine()
    }
    
    func rotation(_ node: SKSpriteNode) {
        node.zRotation = .pi / 4.0
        let rotateAction = SKAction.repeatForever(SKAction.rotate(byAngle: .pi/2, duration: 1))
        node.run(rotateAction)
    }
    
    func setUpDashLine() {
        let dashLine = SKShapeNode()
        dashLine.name = "dashLine"
        
        dashLine.path = setUpDashLinePath()
        dashLine.strokeColor = SKColor.white
        dashLine.lineWidth = 2
        addChild(dashLine)
    }
    
    private func setUpDashLinePath() -> CGPath {
        let path = CGMutablePath()
        path.addLines(between: [
            /*
            CGPoint(x: firstPlanet.position.x + (firstPlanet.size.width / 2), y: firstPlanet.position.y),
            CGPoint(x: secondPlanet.position.x - (secondPlanet.size.width / 2), y: secondPlanet.position.y)
            */
            CGPoint(x: firstPlanet.position.x, y: firstPlanet.position.y),
            CGPoint(x: secondPlanet.position.x, y: secondPlanet.position.y)
        ])
        let pattern: [CGFloat] = [15.0, 5.0]
        return path.copy(dashingWithPhase: 1, lengths: pattern)
    }
    
    func updateDashLine() {
        guard let dashLine = self.childNode(withName: "dashLine") else { return }
        (dashLine as! SKShapeNode).path = setUpDashLinePath()
    }
    
    func deleteDashLine() {
        guard let dashLine = self.childNode(withName: "dashLine") else { return }
        dashLine.run(SKAction.removeFromParent())
    }
    
    func blinkDashLine() {
        guard let dashLine = self.childNode(withName: "dashLine") else { return }
        dashLine.run(SKAction.repeat(
            SKAction.sequence([
                SKAction.run(deleteDashLine),
                SKAction.run(setUpDashLine),
                SKAction.run(deleteDashLine)
            ]), count: 2)
        )
    }
    
    func lepasOrbit() {
        blinkDashLine()
        previousPostition = (firstPlanet.position, secondPlanet.position)
        
        let firstPlanetMove = SKAction.move(to: CGPoint(x: firstPlanet.position.x, y: firstPlanet.position.y - 100), duration: 1)
        firstPlanet.run(firstPlanetMove)
        
        let secondPlanetMove = SKAction.move(to: CGPoint(x: secondPlanet.position.x, y: firstPlanet.position.y + 100), duration: 1)
        secondPlanet.run(secondPlanetMove)
    }
    
    func bertabrakan() {
        blinkDashLine()
        previousPostition = (firstPlanet.position, secondPlanet.position)
        
        let firstPlanetMove = SKAction.move(to: CGPoint(x: size.width/2, y: firstPlanet.position.y), duration: 1)
        firstPlanet.run(firstPlanetMove)
        
        let secondPlanetMove = SKAction.move(to: CGPoint(x: size.width/2, y: firstPlanet.position.y), duration: 1)
        secondPlanet.run(secondPlanetMove)
    }
    
    func updateFirstPlanetMass(previous: Double, current: Double) {
        let result = CGFloat((current - previous) * 10)
        firstPlanet.size.width += result
        firstPlanet.size.height += result
        updateDashLine()
    }
    
    func updateSecondPlanetMass(previous: Double, current: Double) {
        let result = CGFloat((current - previous) * 10)
        secondPlanet.size.width += result
        secondPlanet.size.height += result
        updateDashLine()
    }
    
    func updateDistance(previous: Double, current: Double) {
        let result = CGFloat(CGFloat(current - previous) * distance)
        firstPlanet.position.x -= result
        secondPlanet.position.x += result
        updateDashLine()
    }
}
