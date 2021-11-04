//
//  GerakParabolaScene_M1.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 04/11/21.
//

import UIKit
import SpriteKit

class GerakParabolaScene_M1: SKScene {
//    Initializing the player node
    let player          = SKSpriteNode(imageNamed: "pocong")
//    Initializing the ring nodes
    let lingkarKanan    = SKSpriteNode(imageNamed: "ring_kanan")
    let lingkarKiri     = SKSpriteNode(imageNamed: "ring_kiri")
    let lingkarAtas     = SKSpriteNode(imageNamed: "ring_atas")
    let lingkarBawah    = SKSpriteNode(imageNamed: "ring_bawah")
    let jaringKanan     = SKSpriteNode(imageNamed: "ring_jaring_kanan")
    let jaringKiri      = SKSpriteNode(imageNamed: "ring_jaring_kiri")
    let jaringTengah    = SKSpriteNode(imageNamed: "ring_jaring")
    let tiang           = SKSpriteNode(imageNamed: "tiang")

//    let bg = SKSpriteNode(imageNamed: "background")
//    let roda = SKSpriteNode(imageNamed: "roda")
//    Initializing the projectiles
    let projectile = SKSpriteNode(imageNamed: "bola")
    let projectile1 = SKSpriteNode(imageNamed: "bola")
    let projectile2 = SKSpriteNode(imageNamed: "bola")
    let projectile3 = SKSpriteNode(imageNamed: "bola")
    let projectile4 = SKSpriteNode(imageNamed: "bola")
    let projectile5 = SKSpriteNode(imageNamed: "bola")
    let projectile6 = SKSpriteNode(imageNamed: "bola")
    let projectile7 = SKSpriteNode(imageNamed: "bola")
    let projectile8 = SKSpriteNode(imageNamed: "bola")
    let projectile9 = SKSpriteNode(imageNamed: "bola")
    let projectile10 = SKSpriteNode(imageNamed: "bola")
    var projectileArray: [SKSpriteNode] = []
    var currentProjectile: SKSpriteNode?
    var scoreText = SKLabelNode()
    
    var vectorX = SKShapeNode(rectOf: CGSize(width: 0, height: 0))
    var vectorY = SKShapeNode(rectOf: CGSize(width: 0, height: 0))
    
    var index: Int = 0
    
    var engineSK = EngineGerakParabola()
    var kecAwalScene : Float = 15
    var gravitasiVektor : Float = -9.8
    var sudutTembakScene : Double = 30
    var indexBentol = 0
    var lineActive: Bool = true
    var nodeArrayDeletable: [SKNode] = []
    var janganDihapusArray: [SKNode] = []
    
    // Variabel konversi
    var poinKeMeterDibagi: Float = 15
    var perpindahanXDalamPoin: Float = 0
    
    //variabel passing lambung
    var totalWaktuEngine : Float = 0
    var totalWaktuReal : Float = 0
    var waktuRealTime : Float = 0
    var jarakXMaxEngine : Float = 0
    var jarakXEngine : Float = 0
    var jarakXMaxReal : Float = 0
    var jarakYMaxReal : Float = 0
    var jarakXRealtime : Float = 0
    var jarakYRealtime : Float = 0
    var kecTotal : Float = 0
    var kecepatanXReal : Float = 0
    var kecepatanYreal : Float = 0
    var ketinggianReal : Float = 0
    var ketinggianEngine : Float = 0
    
    //variable UI
    var initialX: CGFloat = 0
    var initialY: CGFloat = 0
    
    //variabel
    var isFinish: Bool = false
    
    
    override func didEvaluateActions() {
        super.didEvaluateActions()
        physicsWorld.gravity = CGVector(dx: 0, dy: CGFloat(gravitasiVektor))
    }
    override func didSimulatePhysics() {
        super.didSimulatePhysics()
        player.position = CGPoint(x: initialX, y: initialY)
    }
    
    override func didApplyConstraints() {
        super.didApplyConstraints()
        
//        vectorY.removeFromParent()
//        vectorX.removeFromParent()
//        vectorX = SKShapeNode(rectOf: CGSize(width: currentProjectile?.physicsBody?.velocity.dx ?? 0, height: 20))
//        vectorX.fillColor = SKColor.red
//
//        vectorX.position.x = CGFloat(0.5 * (currentProjectile?.physicsBody?.velocity.dx ?? 0))
//        vectorX.position.y = CGFloat(0)
//
//        vectorY = SKShapeNode(rectOf: CGSize(width: 20, height: currentProjectile?.physicsBody?.velocity.dy ?? 0))
//        vectorY.position.x = CGFloat(0)
//        vectorY.position.y = CGFloat(0.5 * (currentProjectile?.physicsBody?.velocity.dy ?? 0))
//        vectorY.fillColor = SKColor.blue
//        currentProjectile?.addChild(vectorX)
//        currentProjectile?.addChild(vectorY)
        
        player.zRotation = CGFloat(sudutTembakScene)/55 + 30.15
        
        
        if lineActive == true {
            //        guard let positionBuled = currentProjectile?.position else {return}
            for projectileSekarang in projectileArray {
                if projectileSekarang.physicsBody?.velocity != nil && projectileSekarang.physicsBody?.velocity != .zero {
                    let buled = SKShapeNode(circleOfRadius: 5)
//                    buled.zPosition = -0.1
                    buled.fillColor = SKColor.red
                    buled.position = projectileSekarang.position
                    guard indexBentol % 10 == 0 else {
                        indexBentol += 1
                        return
                    }
                    if children.count > janganDihapusArray.count {
                        if buled.position.y != CGFloat(0) {
                            addChild(buled)
                            nodeArrayDeletable.append(buled)
                        }
                    }
                    
                }
            }
            indexBentol += 1
        }
        
        guard let posisiXProjectile = currentProjectile?.position.x else {return}
        totalWaktuEngine = engineSK.waktuUntukJarakTerjauhEngine(kecepatanAwal: kecAwalScene, sudutTembak: sudutTembakScene, gravitasi: gravitasiVektor, ketinggian: ketinggianEngine )
        totalWaktuReal = engineSK.waktuUntukJarakTerjauhReal(kecepatanAwal: kecAwalScene, sudutTembak: sudutTembakScene, gravitasi: gravitasiVektor, ketinggian: ketinggianReal)
        
        jarakXEngine = Float(posisiXProjectile - initialX)
        perpindahanXDalamPoin = jarakXEngine / poinKeMeterDibagi
        jarakXMaxEngine = Float(engineSK.xProyektilTerhadapWaktuEngine(kecepatanAwal: kecAwalScene, sudutTembak: sudutTembakScene, waktu: totalWaktuEngine))
        jarakXMaxReal = Float(engineSK.xProyektilTerhadapWaktuReal(kecepatanAwal: kecAwalScene, sudutTembak: sudutTembakScene, waktu: totalWaktuReal))
        
        var rasioXEngine = jarakXEngine/jarakXMaxEngine
        
        if jarakXRealtime <= jarakXMaxReal {
            jarakXRealtime = rasioXEngine * jarakXMaxReal
            waktuRealTime = rasioXEngine * totalWaktuReal
            
            kecepatanXReal = Float(engineSK.kecepatanXAwalReal(sudutTembak: sudutTembakScene, kecepatanAwal: kecAwalScene))
            kecepatanYreal = Float(engineSK.kecepatanY(sudutTembak: sudutTembakScene, kecepatanAwal: kecAwalScene, waktu: waktuRealTime, gravitasi: gravitasiVektor))
            
            let kecepatanXKuadrat = pow(kecepatanXReal, 2)
            let kecepatanYKuadrat = pow(kecepatanYreal, 2)
            kecTotal = pow(kecepatanXKuadrat + kecepatanYKuadrat, 0.5)
            
            if rasioXEngine > 0.5 {
                let bedanya = rasioXEngine - 0.5
                rasioXEngine = 0.5 - bedanya
            }
            jarakYRealtime = Float(engineSK.yProyektilTerhadapWaktuReal(kecepatanAwal: kecAwalScene, sudutTembak: sudutTembakScene, waktu: waktuRealTime, gravitasi: gravitasiVektor))
        }

//        player.size = CGSize(width: currentProjectile?.physicsBody?.velocity.dx ?? 100 , height: currentProjectile?.physicsBody?.velocity.dy ?? 100)
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: CGFloat(gravitasiVektor))
        physicsWorld.contactDelegate = self
        physicsWorld.speed = 0.3
        
        initialX = size.width * 0.1
        initialY = size.height * 0.2
        player.position = CGPoint(x: initialX, y: initialY)
        
        setupUI()
//        bg.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
//        bg.zPosition = -1
//        addChild(bg)

        
        player.anchorPoint = CGPoint(x: 0.45, y: 0.3)
        player.zPosition = 0.5
//        roda.zPosition = 1
//        player.addChild(roda)
        
//        player.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        addChild(player)
        janganDihapusArray.append(player)
        
        backgroundColor = SKColor.white // Set the background color
        

        
        projectileArray = [projectile, projectile1, projectile2, projectile3, projectile4, projectile5, projectile6,
                           projectile7, projectile8, projectile9, projectile10]
        for projectile in projectileArray {
            projectile.scale(to: CGSize(width: 40, height: 40))
        }
        
//        physicsBody = SKPhysicsBody(edgeLoopFrom: frame.inset(by: UIEdgeInsets(top: 210, left: 0, bottom: 0, right: 0)))
        
        totalWaktuEngine = engineSK.waktuUntukJarakTerjauhEngine(kecepatanAwal: kecAwalScene, sudutTembak: sudutTembakScene, gravitasi: gravitasiVektor, ketinggian: ketinggianEngine )
        totalWaktuReal = engineSK.waktuUntukJarakTerjauhReal(kecepatanAwal: kecAwalScene, sudutTembak: sudutTembakScene, gravitasi: gravitasiVektor, ketinggian: ketinggianReal)
        
       

    }
    
    func resetLab() {
        for node in nodeArrayDeletable {
            node.removeFromParent()
        }
        for projectileSekarang in projectileArray {
            projectileSekarang.position = CGPoint(x: initialX, y: initialY)
            projectileSekarang.physicsBody?.velocity = .zero
        }
        index = 0
    }
    
    func shootStraight() {
        
        lineActive = true
        jarakXMaxReal = 0
        jarakXRealtime = 0
        
        guard index < projectileArray.count else {return}
 
        currentProjectile = projectileArray[index]
        currentProjectile?.position = CGPoint(x: initialX, y: initialY)
        currentProjectile?.zPosition = 0.3
        currentProjectile?.physicsBody = SKPhysicsBody(circleOfRadius: currentProjectile!.size.width/2)
        currentProjectile?.physicsBody?.isDynamic = true
        currentProjectile?.physicsBody?.allowsRotation = false
        currentProjectile?.physicsBody?.linearDamping = 0
        currentProjectile?.physicsBody?.angularDamping = 0
        currentProjectile?.physicsBody?.friction = 1
        currentProjectile?.physicsBody?.restitution = 0
        currentProjectile?.physicsBody?.categoryBitMask = PhysicsCategory.projectile
        currentProjectile?.physicsBody?.contactTestBitMask = PhysicsCategory.tembok
        currentProjectile?.physicsBody?.collisionBitMask = PhysicsCategory.tembok
        currentProjectile?.physicsBody?.usesPreciseCollisionDetection = true
        currentProjectile?.physicsBody?.velocity = CGVector(dx: engineSK.kecepatanXAwalEngine(sudutTembak: sudutTembakScene, kecepatanAwal: kecAwalScene), dy: engineSK.kecepatanYAwalEngine(sudutTembak: sudutTembakScene, kecepatanAwal: kecAwalScene))
        
        addChild(currentProjectile ?? projectile)
        
        nodeArrayDeletable.append(currentProjectile ?? projectile)
//
//        if let emitter = SKEmitterNode(fileNamed: "MyParticle") {
//            currentProjectile?.addChild(emitter)
////            emitter.physicsBody?.isDynamic = true
//            emitter.targetNode = scene
//            nodeArrayDeletable.append(emitter)
//        }
        
        index += 1
        
    }
// MARK: - Setup UI Scene
    func setupUI() {
        setupRing()
        setupSensor()
        setupLantai()
    }
    
    
    func setupRing() {
        let setRing = [lingkarKiri, lingkarBawah, lingkarAtas,
                       lingkarKanan, jaringKiri, jaringKanan, jaringTengah,tiang]
        for part in setRing {
            part.setScale(0.15)
        }
        
        let rad = lingkarBawah.size.width
        lingkarBawah.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        lingkarBawah.zPosition = 1
       
        
        let kiriTexture = SKTexture(imageNamed: "ring_kiri")
        lingkarKiri.position = CGPoint(x: lingkarBawah.position.x - rad/2 - 5, y: lingkarBawah.position.y + 8)
        let kiriSize = CGSize(width: lingkarKiri.size.width * 0.5, height: lingkarKiri.size.height * 0.5)
        lingkarKiri.physicsBody = SKPhysicsBody(texture: kiriTexture, size: kiriSize)
        
        
        let kananTexture = SKTexture(imageNamed: "ring_kanan")
        lingkarKanan.position = CGPoint(x: lingkarBawah.position.x + rad/2 + 8, y: lingkarBawah.position.y + 7)
        let kananSize = CGSize(width: lingkarKanan.size.width * 0.5, height: lingkarKanan.size.height * 0.5)
        lingkarKanan.physicsBody = SKPhysicsBody(texture: kananTexture, size: kananSize)

        
        lingkarAtas.position = CGPoint(x: lingkarBawah.position.x, y: lingkarBawah.position.y + lingkarKiri.size.height - 2)
      
        
        let jaringKananTexture = SKTexture(imageNamed: "ring_jaring_kanan")
        jaringKanan.position = CGPoint(x: lingkarBawah.position.x + rad/2 + 4,
                                       y: lingkarBawah.position.y - lingkarBawah.size.height - 20)
        let jaringKananSize = CGSize(width: jaringKanan.size.width * 0.5, height: jaringKanan.size.height * 0.5)
        jaringKanan.physicsBody = SKPhysicsBody(texture: jaringKananTexture, size: jaringKananSize)

        
        let jaringKiriTexture = SKTexture(imageNamed: "ring_jaring_kiri")
        jaringKiri.position = CGPoint(x: lingkarBawah.position.x - rad/2 + 2,
                                      y: lingkarBawah.position.y - lingkarBawah.size.height - 20)
        let jaringKiriSize = CGSize(width: jaringKiri.size.width * 0.5, height: jaringKiri.size.height * 0.5)
        jaringKiri.physicsBody = SKPhysicsBody(texture: jaringKiriTexture, size: jaringKiriSize)

        
        jaringTengah.position = CGPoint(x: lingkarBawah.position.x + 3,
                                        y: lingkarBawah.position.y - lingkarBawah.size.height - 20)
        jaringTengah.zPosition = 1

        
        tiang.position = CGPoint(x: lingkarKanan.position.x + lingkarKanan.size.width, y: lingkarKanan.position.y - tiang.size.height/2)
        let tiangTexture = SKTexture(imageNamed: "tiang")
        let tiangSize = CGSize(width: tiang.size.width * 0.5, height: tiang.size.height * 0.5)
        tiang.physicsBody = SKPhysicsBody(texture: tiangTexture, size: tiangSize)
        
        for part in setRing {
            part.physicsBody?.isDynamic = false
            part.physicsBody?.affectedByGravity = false
            addChild(part)
        }
    }
    
    
    
    func setupSensor() {
        let rad = lingkarBawah.size.width
        let sensor = SKShapeNode(circleOfRadius: rad/8)
        sensor.position = CGPoint(x: lingkarBawah.position.x, y: lingkarBawah.position.y - 5)
        sensor.strokeColor = .blue
        sensor.physicsBody = SKPhysicsBody(circleOfRadius: rad/6)
        sensor.physicsBody?.isDynamic = false
        sensor.physicsBody?.affectedByGravity = false
        sensor.physicsBody?.allowsRotation = false
        sensor.physicsBody?.categoryBitMask = PhysicsCategory.sensor
        sensor.physicsBody?.contactTestBitMask = PhysicsCategory.projectile
        sensor.physicsBody?.collisionBitMask = PhysicsCategory.none
        sensor.physicsBody?.usesPreciseCollisionDetection = true
        addChild(sensor)
    }
    
    func setupScoreText() {
        scoreText.fontSize = 70
        scoreText.fontName = "helvetica"
        scoreText.fontColor = UIColor.black
        scoreText.text = "Score: 0"
        scoreText.zPosition = -2
        scoreText.position = CGPoint(x: frame.midX, y: 500)
        addChild(scoreText)
    }

    func setupLantai() {
        let lantai = SKSpriteNode(color: SKColor.red, size: CGSize(width: 3000, height: 10))
        lantai.position = CGPoint(x: initialX, y: initialY - 50)
        lantai.zPosition = 0.3
        lantai.physicsBody = SKPhysicsBody(rectangleOf: lantai.size)
        lantai.physicsBody!.isDynamic = false
        lantai.physicsBody?.allowsRotation = false
        lantai.physicsBody?.linearDamping = 0
        lantai.physicsBody?.angularDamping = 0
        lantai.physicsBody?.friction = 1
        lantai.physicsBody?.restitution = 0
        lantai.physicsBody?.categoryBitMask = PhysicsCategory.tembok
        lantai.physicsBody?.contactTestBitMask = PhysicsCategory.projectile
        lantai.physicsBody?.collisionBitMask = PhysicsCategory.projectile
        lantai.physicsBody?.usesPreciseCollisionDetection = true
        self.addChild(lantai)
    }
}


// MARK: - Tumbukan kawan~
extension GerakParabolaScene_M1: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 2
        if ((firstBody.categoryBitMask & PhysicsCategory.tembok != 0) &&
                (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
            if let tembox = firstBody.node as? SKSpriteNode,
               let projectile = secondBody.node as? SKSpriteNode {
                projectileDidCollideWithTembox(projectile: projectile, tembox: tembox)
            }
        }
        
        if ((firstBody.categoryBitMask & PhysicsCategory.sensor != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
                isFinish = true
        }
    }
    
    func projectileDidCollideWithTembox(projectile: SKSpriteNode, tembox: SKSpriteNode) {
        print("Hit")
        projectile.physicsBody?.velocity = .zero
        projectile.removeAllChildren()
        
        //        if monstersDestroyed > 30 {
        //            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        //            let gameOverScene = GameOverScene(size: self.size, won: true)
        //            view?.presentScene(gameOverScene, transition: reveal)
        //        }
    }
}

