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
    @IBOutlet weak var jalankanButton: UIButton!
    @IBOutlet weak var gravitationButton: UIButton!
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
   
    var experimentVM: ExperimentDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(experimentVM.check) dan \(experimentVM.experiments.rawValue)")
//        navigationController?.navigationBar.topItem?.title = "Eksperimen Gerak Parabola"
        setupSpriteView()
        setupControlPanel()
    }
    //test
    // MARK: - Pressed Button Function
    
    @objc func buttonAction(sender: UIButton!) {
            print("oi asw")
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
        print("anjay")
    }
    
    @IBAction func jalankanBtnPressed(_ sender: Any) {
        guard let gameScene = spriteView.scene as? GerakParabolaScene else {return}
        gameScene.shootStraight()
    }
    
    // MARK: - SETUP UI
    
    func setupSpriteView() {
        spriteScene = GerakParabolaScene(size: spriteView.bounds.size)
        spriteScene.delegate = self
        spriteView.delegate = self
        spriteView.presentScene(spriteScene)
    }
    func setupControlPanel() {
        setupGravitationButton()
        setupTheoryButton()
        setupJalankanButton()
        setupMissionBox()
        setupSliders()
        setupTextField()
    }
    
    func setupXIB() {
    }
    
    func setupTextField () {
        kecepatanTxtField.text = "15"
        kecepatanTxtField.isEnabled = false
        
        sudutTxtField.text = "30"
        sudutTxtField.isEnabled = false
    }
    func setupSliders() {
        sudutSlider.maximumValue = 90
        sudutSlider.minimumValue = 0
        sudutSlider.value = 30
        
        kecepatanSlider.maximumValue = 25
        kecepatanSlider.minimumValue = 10
        kecepatanSlider.value = 15
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupMissionBox() {
        missionBox.layer.cornerRadius = 8
    }
    
    func setupGravitationButton() {
    }
    
    func setupTheoryButton() {
        let imageSize:CGSize = CGSize(width: 15, height: 15)
        button.frame = CGRect(x: (jalankanButton.layer.position.x) - 130, y: ((1-0.284173) * view.bounds.height) + 28, width: 65, height: 65)
        print(view.bounds.width)
        button.setImage(UIImage(systemName: "book.closed.fill"), for: UIControl.State.normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(
            top: (button.frame.size.height - imageSize.height) / 4,
            left: (button.frame.size.width - imageSize.width) / 4,
            bottom: (button.frame.size.height - imageSize.height) / 4,
            right: (button.frame.size.width - imageSize.width) / 4)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = .yellow
        self.view.addSubview(button)
    }
    
    func setupInfoButon() {
    }
    
    func setupJalankanButton () {
        jalankanButton.layer.cornerRadius = 8
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
//            finishAlert.everyMissionLabel_1.text = "hahahha"
//            finishAlert.everyMissionLabel_2.text = "test 22
            self.present(finishAlert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                finishAlert.dismiss(animated: true, completion: nil)
            }
            
        }
    }
}
