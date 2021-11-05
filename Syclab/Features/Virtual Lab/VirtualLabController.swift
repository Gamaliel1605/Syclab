//
//  VirtualLabController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit
import SpriteKit
class VirtualLabController: UIViewController, GravityPopoverDelegate {
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var theoryButton: UIButton!
    @IBOutlet weak var gravitationButton: UIButton!
    @IBOutlet weak var playButton: DesignableButton!
    @IBOutlet weak var resetButton: DesignableButton!
    @IBOutlet weak var sudutLbl: UILabel!
    @IBOutlet weak var sudutSlider: UISlider!
    @IBOutlet weak var kecepatanLbl: UILabel!
    @IBOutlet weak var kecepatanSlider: UISlider!
    @IBOutlet weak var kecepatanTxtField: UITextField!
    @IBOutlet weak var sudutTxtField: UITextField!
    @IBOutlet weak var unitLbl1: UILabel!
    @IBOutlet weak var unitLbl2: UILabel!
    @IBOutlet weak var spriteView: SKView!
    @IBOutlet weak var missionBox: UIView!
    @IBOutlet weak var titleMissionLabel: UILabel!
    @IBOutlet weak var descMissionLabel: UILabel!
    let button:UIButton = UIButton(type: UIButton.ButtonType.custom)
    
    var spriteScene: SKScene!
    var virtualLabVM: VirtualLabViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSpriteView()
        setupScene()
        setupControlPanel()
    }
    // MARK: - Pressed Button Function
    
    //    @objc func playButtonPressed(sender: UIButton!) {
    //        guard let gameScene = spriteView.scene as? GerakParabolaScene else {return}
    //        gameScene.shootStraight()
    //    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        guard let scene = spriteScene as? GerakParabolaScene else {return}
        scene.resetLab()
    }
    @IBAction func kecepatanSliderChanged(_ sender: UISlider) {
        guard let scene = spriteScene as? GerakParabolaScene else {return}
        scene.kecAwalScene = sender.value
        kecepatanTxtField.text = String(round(sender.value * 10) / 10)
    }
    
    @IBAction func sudutSliderChanged(_ sender: UISlider) {
        guard let scene = spriteScene as? GerakParabolaScene else {return}
        if Double(sender.value) < 90 {
            scene.sudutTembakScene = Double(sender.value)
        } else {
            scene.sudutTembakScene = 89.99999
        }
        sudutTxtField.text = String(round(sender.value * 10) / 10)
    }
    
    
    @IBAction func gravitationBtnPressed(_ sender: Any) {
        let gravityChoice = GravityPopoverViewController()
        gravityChoice.delegate = self
        gravityChoice.modalPresentationStyle = .popover
        gravityChoice.preferredContentSize = CGSize(width: 200, height: 200)
        let popover: UIPopoverPresentationController = gravityChoice.popoverPresentationController!
        popover.sourceView = gravitationButton
        self.present(gravityChoice, animated: true, completion: nil)
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        guard let gameScene = spriteView.scene as? GerakParabolaScene else {return}
        gameScene.shootStraight()
    }
    @IBAction func theoryButtonPressed(_ sender: Any) {
        
    }
    
    // MARK: - SETUP UI
    
    func setupSpriteView() {
        spriteScene = GerakParabolaScene(isMission: virtualLabVM?.isMission ?? false, size: spriteView.bounds.size)
        spriteScene.delegate = self
        spriteView.delegate = self
        spriteView.presentScene(spriteScene)
        
        
    }
    
    func setupScene() {
        if (virtualLabVM?.isMission ?? false) {
            switch virtualLabVM?.experiment {
            case .E1_GerakParabola:
                guard let mission = virtualLabVM?.currentMission() as? GerakParabolaMission else {return}
                guard let scene = spriteView.scene as? GerakParabolaScene else {return}
                scene.sudutTembakScene = Double(mission.sudutValue)
                scene.kecAwalScene = mission.kecepatanValue
                scene.repositioningRing(xRelatif: mission.xRelatif , yRelatif: mission.yRelatif)
            case .E2_HukumGravitasiNewton:
                print("omg belom jadi")
            case .none:
                fatalError("lah experimentnya ga ada")
            }
        }
    }
    
    func setupControlPanel() {
        //        setupMissionBox()
        setupGravitationButton()
        //        setupPlayButton()
        setupTheoryButton()
        //        setupSliders()
        initView()
        setupMissionView()
    }
    
    func initView() {
        sudutSlider.maximumValue = 90
        sudutSlider.minimumValue = 0
        kecepatanSlider.maximumValue = 25
        kecepatanSlider.minimumValue = 10
        
        missionBox.layer.cornerRadius = 8
    }
    
    func setupSliders() {
        if virtualLabVM?.isMission ?? false {
            switch virtualLabVM?.experiment {
            case .E1_GerakParabola:
                guard let mission = virtualLabVM?.currentMission() as? GerakParabolaMission else {return}
                kecepatanSlider.value = mission.kecepatanValue
                sudutSlider.value = mission.sudutValue
                kecepatanTxtField.text = "\(mission.kecepatanValue)"
                sudutTxtField.text = "\(mission.sudutValue)"
                for slider in mission.enabledVariables {
                    if slider == .Sudut {
                        sudutSlider.isEnabled = true
                        sudutTxtField.isEnabled = true
                        kecepatanSlider.isEnabled = false
                        kecepatanTxtField.isEnabled = false
                    }
                    if slider == .Kecepatan {
                        kecepatanSlider.isEnabled = true
                        kecepatanTxtField.isEnabled = true
                        sudutSlider.isEnabled = false
                        sudutTxtField.isEnabled = false
                    }
                }
            case .E2_HukumGravitasiNewton:
                print("belom ada euy")
            case .none:
                fatalError("lah ga ada experimentnya cug")
            }
        } else {
            sudutSlider.value = 30
            kecepatanSlider.value = 15
            kecepatanTxtField.text = "15"
            sudutTxtField.text = "30"
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupMissionView() {
        if virtualLabVM?.isMission ?? false {
            switch virtualLabVM?.experiment {
            case .E1_GerakParabola:
                guard let mission = virtualLabVM?.currentMission() as? GerakParabolaMission else {return}
                kecepatanSlider.value = mission.kecepatanValue
                sudutSlider.value = mission.sudutValue
                kecepatanTxtField.text = "\(mission.kecepatanValue)"
                sudutTxtField.text = "\(mission.sudutValue)"
                
                titleMissionLabel.text = "Misi \(virtualLabVM!.indexMission + 1) dari \(String(describing: virtualLabVM!.missions!.count))"
                descMissionLabel.text = mission.missionText
                
                for slider in mission.enabledVariables {
                    if slider == .Sudut {
                        sudutSlider.isEnabled = true
                        sudutTxtField.isEnabled = true
                        kecepatanSlider.isEnabled = false
                        kecepatanTxtField.isEnabled = false
                    }
                    if slider == .Kecepatan {
                        kecepatanSlider.isEnabled = true
                        kecepatanTxtField.isEnabled = true
                        sudutSlider.isEnabled = false
                        sudutTxtField.isEnabled = false
                    }
                }
            case .E2_HukumGravitasiNewton:
                print("belom ada euy")
            case .none:
                fatalError("lah ga ada experimentnya cug")
            }
        } else {
            sudutSlider.value = 30
            kecepatanSlider.value = 15
            kecepatanTxtField.text = "15"
            sudutTxtField.text = "30"
            missionBox.isHidden = true
        }
    }
    
    func setupMissionBox() {
        if (virtualLabVM?.isMission ?? false) {
            switch virtualLabVM?.experiment {
            case .E1_GerakParabola:
                guard let mission = virtualLabVM?.currentMission() as? GerakParabolaMission else {return}
                titleMissionLabel.text = "Misi \(virtualLabVM!.indexMission + 1) dari \(String(describing: virtualLabVM!.missions!.count))"
                descMissionLabel.text = mission.missionText
            case .E2_HukumGravitasiNewton:
                print("omg belom jadi")
            case .none:
                fatalError("lah experimentnya ga ada")
            }
        } else {
            missionBox.isHidden = true
        }
    }
    
    func setupGravitationButton() {
    }
    
    func setupPlayButton() {
        let imageSize:CGSize = CGSize(width: 15, height: 15)
        button.frame = CGRect(x: (theoryButton.layer.position.x) - 130, y: ((1-0.284173) * view.bounds.height) + 28, width: 65, height: 65)
        button.setImage(UIImage(systemName: "book.closed.fill"), for: UIControl.State.normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(
            top: (button.frame.size.height - imageSize.height) / 4,
            left: (button.frame.size.width - imageSize.width) / 4,
            bottom: (button.frame.size.height - imageSize.height) / 4,
            right: (button.frame.size.width - imageSize.width) / 4)
        button.layer.cornerRadius = 8
        //        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        button.backgroundColor = .yellow
        self.view.addSubview(button)
    }
    
    func setupInfoButon() {
    }
    
    func setupTheoryButton () {
        //        theoryButton.layer.cornerRadius = 8
    }
    
    
    // MARK: - PROTOCOL
    func chooseGravity(chosenValue planet: Planet) {
        gravitationButton.setTitle(planet.rawValue + " \(planet.getGravityValue()) m/s²", for: .normal)
        print("juancog")
    }
}


extension VirtualLabController: SKSceneDelegate,SKViewDelegate {
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        guard let scene = scene as? GerakParabolaScene else {return}
        if scene.isFinish {
            scene.isFinish = false
            let finishAlert = EveryMission()
            if virtualLabVM?.isMission ?? false {
                if virtualLabVM!.indexMission < (virtualLabVM?.missions!.count)! - 1 {
                    self.present(finishAlert, animated: true, completion: nil)
                    
                    switch virtualLabVM?.indexMission {
                    case 0:
                        finishAlert.everyMissionLabel_1.text = "Misi Pertama Selesai"
                    case 1:
                        finishAlert.everyMissionLabel_1.text = "Misi Kedua Selesai"
                    case 2:
                        finishAlert.everyMissionLabel_1.text = "Misi Ketiga Selesai"
                    case 3:
                        finishAlert.everyMissionLabel_1.text = "Misi Keempat Selesai"
                    case 4:
                        finishAlert.everyMissionLabel_1.text = "Misi Kelima Selesai"
                    case .none:
                        print("lol")
                    case .some(_):
                        print("offside")
                    }
                    finishAlert.everyMissionLabel_2.text = "Lanjut misi \(virtualLabVM!.indexMission + 2)"
                }
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [self] in
                finishAlert.dismiss(animated: true, completion: nil)
                switch virtualLabVM?.experiment {
                case .E1_GerakParabola:
                    virtualLabVM?.indexMission += 1
                    setupMissionView()
                    setupScene()
                case .E2_HukumGravitasiNewton:
                    print("belom jadi")
                case .none:
                    fatalError("mampus experimentnya ilang")
                }
            }
        }
    }
}
