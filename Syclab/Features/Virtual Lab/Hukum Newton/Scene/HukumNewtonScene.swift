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
    var modeOption: modeOption = .Eksplorasi
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: size.width, height: size.height)
        addChild(background)
        
        firstPlanet.position = CGPoint(x: size.width * 0.2, y: size.height * 0.3)
        firstPlanet.size = CGSize(width: size.width * 0.15, height: size.width * 0.15)
        firstPlanet.physicsBody = SKPhysicsBody(circleOfRadius: firstPlanet.size.width/7)
        firstPlanet.physicsBody?.categoryBitMask = HukumNewtonPhysicsCategory.firstPlanet
        firstPlanet.physicsBody?.contactTestBitMask = HukumNewtonPhysicsCategory.secondPlanet
        firstPlanet.physicsBody?.collisionBitMask = HukumNewtonPhysicsCategory.none
        addChild(firstPlanet)
        
        secondPlanet.position = CGPoint(x: size.width - (size.width * 0.2), y: size.height * 0.3)
        secondPlanet.size = CGSize(width: size.width * 0.15, height: size.width * 0.15)
        secondPlanet.physicsBody = SKPhysicsBody(circleOfRadius: secondPlanet.size.width/7)
        secondPlanet.physicsBody?.categoryBitMask = HukumNewtonPhysicsCategory.secondPlanet
        secondPlanet.physicsBody?.contactTestBitMask = HukumNewtonPhysicsCategory.firstPlanet
        secondPlanet.physicsBody?.collisionBitMask = HukumNewtonPhysicsCategory.none
        rotation(secondPlanet)
        addChild(secondPlanet)
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        distance = firstPlanet.position.distanceFromCGPoint(point: secondPlanet.position) / 20
        
        setUpDashLine()
    }
    
    func reset() {
        firstPlanet.position = previousPostition.firstPlanet
        secondPlanet.position = previousPostition.SecondPlanet
        setUpDashLine()
        modeOption = .Eksplorasi
        guard let crash = self.childNode(withName: "crash") else { return }
        crash.run(SKAction.removeFromParent())
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
    
    func lepasOrbit() {
        deleteDashLine()
        previousPostition = (firstPlanet.position, secondPlanet.position)
        run(SKAction.playSoundFileNamed("jalan1s.mp3", waitForCompletion: false))
        
        let firstPlanetMove = SKAction.move(to: CGPoint(x: firstPlanet.position.x, y: firstPlanet.position.y - 100), duration: 1)
        firstPlanet.run(firstPlanetMove)
        
        let secondPlanetMove = SKAction.move(to: CGPoint(x: secondPlanet.position.x, y: firstPlanet.position.y + 100), duration: 1)
        secondPlanet.run(secondPlanetMove)
    }
    
    func bertabrakan() {
        deleteDashLine()
        previousPostition = (firstPlanet.position, secondPlanet.position)
        run(SKAction.playSoundFileNamed("jalan1s.mp3", waitForCompletion: false))
        
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
