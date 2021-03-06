//
//  VirtualLabController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit
import SpriteKit

class VirtualLabController: UIViewController {
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var theoryButton: UIButton!
    @IBOutlet weak var gravitationButton: UIButton!
    @IBOutlet weak var gravitationLbl: UILabel!
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
        setupBackButton()
        self.navigationController?.navigationBar.barTintColor?.withAlphaComponent(0)
    }
    
    // MARK: - Pressed Button Function
    @objc func back(sender: UIBarButtonItem) {
        if virtualLabVM?.check == .Misi {
            guard let scene = spriteScene as? GerakParabolaScene else {return}
            scene.isPaused = true
            let exitAlert = Exit()
            exitAlert.delegate = self
            self.present(exitAlert, animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func instructionButtonPressed(_ sender: Any) {
        let labInstructionsView = LabInstructions(frame: CGRect(x: self.view.bounds.width - (367+20),
                                                                y: 40,
                                                                width: 367,
                                                                height: 527)
        )
        labInstructionsView.delegate = self
        labInstructionsView.tag = 100
        self.view.addSubview(labInstructionsView)
        
        let labInstructionsContentView = UIView()
        labInstructionsView.scrollView.addSubview(labInstructionsContentView)
        labInstructionsContentView.translatesAutoresizingMaskIntoConstraints = false
        labInstructionsContentView.topAnchor.constraint(equalTo: labInstructionsView.scrollView.topAnchor).isActive = true
        labInstructionsContentView.leadingAnchor.constraint(equalTo: labInstructionsView.scrollView.leadingAnchor).isActive = true
        labInstructionsContentView.trailingAnchor.constraint(equalTo: labInstructionsView.scrollView.trailingAnchor).isActive = true
        labInstructionsContentView.bottomAnchor.constraint(equalTo: labInstructionsView.scrollView.bottomAnchor).isActive = true
        labInstructionsContentView.widthAnchor.constraint(equalTo: labInstructionsView.scrollView.widthAnchor).isActive = true
        
        var elements = [UIView]()
        
        guard let experiment = virtualLabVM?.experiment else {return}
        var labInstructionsContents: [Any] = []
        
        switch virtualLabVM?.check {
        case .Eksplorasi:
            labInstructionsContents = experiment.getExplorationLabInstruction().labInstructions
        case .Misi:
            labInstructionsContents = experiment.getMissionLabInstruction().labInstructions
        default:
            ()
        }
        
        for (index, labInstructionsContent) in labInstructionsContents.enumerated() {
            if(labInstructionsContent is ContentImage) {
                let imageView = (labInstructionsContent as! ContentImage).create(
                    elementsContainer: labInstructionsContentView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: labInstructionsContents.endIndex - 1
                )
                elements.append(imageView)
            } else if (labInstructionsContent is ContentLabel) {
                let label = (labInstructionsContent as! ContentLabel).create(
                    elementsContainer: labInstructionsContentView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: labInstructionsContents.endIndex - 1
                )
                elements.append(label)
            }
        }
    }
    
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
        gameScene.shoot()
//        gameScene.bolaPlaceholder.removeFromParent()
//        playButton.isEnabled = false
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
//
//            self?.playButton.isEnabled = true
//            gameScene.lenganKanan.addChild(gameScene.bolaPlaceholder)
//        }
    }
    @IBAction func theoryButtonPressed(_ sender: Any) {
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        backgroundView.backgroundColor = .black.withAlphaComponent(0.3)
        backgroundView.tag = 100
        self.view.addSubview(backgroundView)
        
        let conceptTheoryView = ConceptTheory(frame: CGRect(x: self.view.center.x - (843/2),
                                                            y: self.view.center.y - (620/2),
                                                            width: 843,
                                                            height: 620)
        )
        conceptTheoryView.delegate = self
        
        backgroundView.addSubview(conceptTheoryView)
        
        let conceptTheoryContentView = UIView()
        conceptTheoryView.scrollView.addSubview(conceptTheoryContentView)
        conceptTheoryContentView.translatesAutoresizingMaskIntoConstraints = false
        conceptTheoryContentView.topAnchor.constraint(equalTo: conceptTheoryView.scrollView.topAnchor).isActive = true
        conceptTheoryContentView.leadingAnchor.constraint(equalTo: conceptTheoryView.scrollView.leadingAnchor).isActive = true
        conceptTheoryContentView.trailingAnchor.constraint(equalTo: conceptTheoryView.scrollView.trailingAnchor).isActive = true
        conceptTheoryContentView.bottomAnchor.constraint(equalTo: conceptTheoryView.scrollView.bottomAnchor).isActive = true
        conceptTheoryContentView.widthAnchor.constraint(equalTo: conceptTheoryView.scrollView.widthAnchor).isActive = true
        
        var elements = [UIView]()
        
        guard let experiment = virtualLabVM?.experiment else {return}
        let conceptTheoryContents = experiment.getConceptTheory().conceptTheory
        for (index, conceptTheoryContent) in conceptTheoryContents.enumerated() {
            if (conceptTheoryContent is ContentImage) {
                let imageView = (conceptTheoryContent as! ContentImage).create(
                    elementsContainer: conceptTheoryContentView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: conceptTheoryContents.endIndex - 1
                )
                elements.append(imageView)
            } else if (conceptTheoryContent is ContentLabel) {
                let label = (conceptTheoryContent as! ContentLabel).create(
                    elementsContainer: conceptTheoryContentView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: conceptTheoryContents.endIndex - 1
                )
                elements.append(label)
            }
        }

        
    }
    
    // MARK: - SETUP UI
    
    //        override var prefersStatusBarHidden: Bool {
    //            return true
    //        }
    //
    func setupBackButton() {

        self.navigationItem.setHidesBackButton(true, animated:false)

        //your custom view for back image with custom size
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 70, height: 700))
        if let chevron = UIImage(systemName: "chevron.backward") {
            imageView.image = chevron
            imageView.tintColor = UIColor.mainColorButton
        }
        
        let label = UILabel()
        
        if let title = virtualLabVM?.title {
            label.text = " \(title)"
            label.textColor = UIColor.mainColorButton
            label.font = .boldSystemFont(ofSize: 20)
        }
        let view2 = UIStackView(arrangedSubviews: [imageView, label])
        let backTap = UITapGestureRecognizer(target: self, action: #selector(back(sender:)))
        view2.addGestureRecognizer(backTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view2 )
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
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
                scene.repositioningRing(xRelatif: mission.xRelatif)
            case .E2_HukumGravitasiNewton:
                print("omg belom jadi")
            case .E3_GerakMelingkar:
                print("omg belom jadi")
            case .E4_FluidaStatis:
                print("omg belom jadi")
            case .none:
                fatalError("lah experimentnya ga ada")
            }
        }
    }
    
    func setupControlPanel() {
        setupTextField()
        setupGravitationButton()
        setupTheoryButton()
        initView()
        setupMissionView()
    }
    
    func setupTextField() {
        kecepatanTxtField.isUserInteractionEnabled = false
        sudutTxtField.isUserInteractionEnabled = false
    }
    
    func initView() {
        sudutSlider.maximumValue = 90
        sudutSlider.minimumValue = 0
        kecepatanSlider.maximumValue = 25
        kecepatanSlider.minimumValue = 10
        
        missionBox.layer.cornerRadius = 8
        missionBox.layer.borderWidth = 1
        missionBox.layer.borderColor = UIColor.darkGray.cgColor
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
            case .E3_GerakMelingkar:
                print("belom ada euy")
            case .E4_FluidaStatis:
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
    
    func setupMissionView() {
        if virtualLabVM?.isMission ?? false {
            gravitationButton.isEnabled = false
            gravitationButton.alpha = 0.5
            gravitationLbl.isEnabled = false
            
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
                        sudutLbl.isEnabled = true
                        kecepatanSlider.isEnabled = false
                        kecepatanTxtField.isEnabled = false
                        kecepatanLbl.isEnabled = false
                    }
                    if slider == .Kecepatan {
                        kecepatanSlider.isEnabled = true
                        kecepatanTxtField.isEnabled = true
                        kecepatanLbl.isEnabled = true
                        sudutSlider.isEnabled = false
                        sudutTxtField.isEnabled = false
                        sudutTxtField.isEnabled = false
                    }
                }
            case .E2_HukumGravitasiNewton:
                print("belom ada euy")
            case .E3_GerakMelingkar:
                print("belom ada euy")
            case .E4_FluidaStatis:
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
            case .E3_GerakMelingkar:
                print("omg belom jadi")
            case .E4_FluidaStatis:
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
        theoryButton.tintColor = UIColor.mainColorButton
        
    }
}
// MARK: - PROTOCOL
extension VirtualLabController: GravityPopoverDelegate {
    func chooseGravity(chosenValue planet: Planet) {
        gravitationButton.setTitle(planet.rawValue + " \(planet.getGravityValue()) m/s??", for: .normal)
        guard let scene = spriteView.scene as? GerakParabolaScene else {return}
        scene.gravitasiVektor = (Float(-planet.getGravityValue()))
    }
}

extension VirtualLabController: SKSceneDelegate,SKViewDelegate {
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        guard let scene = scene as? GerakParabolaScene else {return}
        
        if scene.isOnAir {
            playButton.isEnabled = false
            playButton.isUserInteractionEnabled = false
            scene.isOnAir = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.playButton.isEnabled = true
                self.playButton.isUserInteractionEnabled = true
            }
        }
        
        if scene.isFinish {
            scene.isFinish = false
            scene.sensor.removeFromParent()
            
            if virtualLabVM?.isMission ?? false {
                
                let finishAlert = EveryMission()
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
                
                guard let mission = virtualLabVM?.currentMission() as? GerakParabolaMission else {return}
                finishAlert.everyMissionRumusImage.image = mission.explainationImage
                finishAlert.everyMissionLabel_2.text = mission.explainationText
                
                
                if virtualLabVM!.indexMission < (virtualLabVM?.missions!.count)! - 1 {
                    finishAlert.nextMissionButton.setTitle("Lanjut misi \((virtualLabVM?.indexMission)! + 2)", for: .normal)
                    finishAlert.nextMissionButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
                    finishAlert.delegate = self
                    
                    switch virtualLabVM?.experiment {
                    case .E1_GerakParabola:
                        virtualLabVM?.indexMission += 1
                        setupMissionView()
                        setupScene()
                    case .E2_HukumGravitasiNewton:
                        print("belom jadi")
                    case .E3_GerakMelingkar:
                        print("belom jadi")
                    case .E4_FluidaStatis:
                        print("belom jadi")
                    case .none:
                        fatalError("mampus experimentnya ilang")
                    }
                    scene.resetLab()
                } else {
                    finishAlert.nextMissionButton.setTitle("Berikutnya", for: .normal)
                    finishAlert.nextMissionButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
                    finishAlert.delegate = self
                    virtualLabVM?.indexMission += 1
                }
            }
        }
    }
}


extension VirtualLabController: FinishAlertProtocol {
    func onTapKeluarFinish() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func onTapToQuiz() {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "quiz") as! QuizController
        if let experiment = virtualLabVM?.experiment {
            viewController.quizVM = QuizViewModel(experiment: experiment)
            let allControllers = self.navigationController?.viewControllers
            let idx = allControllers!.count-2
            let pusher = allControllers![idx]
            self.navigationController?.popViewController(animated: false)
            pusher.navigationController?.pushViewController(viewController, animated: false)
        }
        
    }
}

extension VirtualLabController: ExitAlertProtocol {
    func onTapKeluar() {
        self.navigationController?.popViewController(animated: true)
    }
    func onTapBatal() {
        guard let scene = spriteScene as? GerakParabolaScene else {return}
        scene.isPaused = false
    }
}

extension VirtualLabController: DismissProtocol {
    func dismissView() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
}

extension VirtualLabController: EveryMissionAlertProtocol {
    func onTapNextMission() {
        if virtualLabVM!.indexMission < (virtualLabVM?.missions!.count)!  {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
            let finishAlert = FinishMission()
            self.present(finishAlert, animated: true, completion: nil)
            finishAlert.delegate = self
        }
        
    }
}
