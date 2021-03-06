//
//  VirtualLabHukumNewtonViewController.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 13/11/21.
//

import UIKit
import SpriteKit

class VirtualLabHukumNewtonViewController: UIViewController {

    @IBOutlet weak var forceView: UIView!
    @IBOutlet weak var forceLabel: UILabel!
    
    @IBOutlet weak var missionView: UIView!
    @IBOutlet weak var missionTitleLabel: UILabel!
    @IBOutlet weak var missionTextLabel: UILabel!
    
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var conceptTheoryButton: UIButton!
    
    @IBOutlet weak var massa1_TextField: UITextField!
    @IBOutlet weak var massa2_TextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var HukumNewtonSKView: SKView!
    
    @IBOutlet weak var massa1_Slider: UISlider!
    @IBOutlet weak var massa2_Slider: UISlider!
    @IBOutlet weak var distanceSlider: UISlider!
    
    let step: Float = 1
    let consGravity: Float = 10
    var dashboardModel = HukumNewtonDashboardModel.shared
    var currentVLab: SKScene!
    var virtualLabVM: VirtualLabViewModel!
    let queue = DispatchQueue(label: "HukumNewtonQueue")
    var flagCancelIsTrue = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackButton()
        setUpDasboardView()
        setUpSKView()
        
        switch virtualLabVM.isMission {
        case true:
            setUpMission()
        case false:
            missionView.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        resetVLab(self)
        self.removeKeyboardObserver()
    }
    
    private func setUpBackButton() {
        let myButton = UIButton(type: .system)
        myButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        myButton.setTitle("  Hukum Gravitasi Newton", for: .normal)
        myButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        myButton.sizeToFit()
        myButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: myButton)
    }
    
    @objc private func goBack() {
        if virtualLabVM.check == .Misi {
            queue.suspend()
            currentVLab.isPaused = true
            let exitAlert = Exit()
            exitAlert.delegate = self
            self.present(exitAlert, animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setUpDasboardView() {
        missionView.layer.cornerRadius = 10
        forceView.layer.cornerRadius = 10
        
        forceLabel.layer.backgroundColor = UIColor.init(white: 1, alpha: 0.5).cgColor
        forceLabel.layer.cornerRadius = 8
        forceLabel.layer.borderWidth = 0.5
        forceLabel.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        infoButton.layer.cornerRadius = 20
        resetButton.layer.cornerRadius = 20
        playButton.layer.cornerRadius = 20
        conceptTheoryButton.layer.cornerRadius = 20
        conceptTheoryButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    private func setUpSKView() {
        let scene = HukumNewtonScene(size: HukumNewtonSKView.bounds.size)
        scene.scaleMode = .aspectFill
        HukumNewtonSKView.presentScene(scene)
        currentVLab = scene
    }
    
    private func setUpMission() {
        resetVLab(self)
        
        guard let missions = virtualLabVM.missions as? [HukumNewtonMission] else { return }
        let currentMission = missions[virtualLabVM.indexMission]
        
        missionTitleLabel.text = "Misi \(virtualLabVM.indexMission + 1) dari \(missions.count)"
        missionTextLabel.text = currentMission.missionText
        
        disableAllVariables()
        enableVariable(currentMission.variables)
    }
    
    private func disableAllVariables() {
        massa1_Slider.tintColor = .lightGray
        massa1_Slider.isUserInteractionEnabled = false
//        massa1_TextField.isUserInteractionEnabled = false
        massa1_TextField.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        
        massa2_Slider.tintColor = .lightGray
        massa2_Slider.isUserInteractionEnabled = false
//        massa2_TextField.isUserInteractionEnabled = false
        massa2_TextField.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        
        distanceSlider.tintColor = .lightGray
        distanceSlider.isUserInteractionEnabled = false
//        distanceTextField.isUserInteractionEnabled = false
        distanceTextField.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
    }
    
    private func enableVariable(_ variables: [HukumNewtonVariables]) {
        for variable in variables {
            switch variable {
            case .firstMass:
                massa1_Slider.tintColor = UIColor.init(hexString: "#16384E")
                massa1_Slider.isUserInteractionEnabled = true
//                massa1_TextField.isUserInteractionEnabled = true
                massa1_TextField.backgroundColor = UIColor.white
            case .secondMass:
                massa2_Slider.tintColor = UIColor.init(hexString: "#16384E")
                massa2_Slider.isUserInteractionEnabled = true
//                massa2_TextField.isUserInteractionEnabled = true
                massa2_TextField.backgroundColor = UIColor.white
            case .distance:
                distanceSlider.tintColor = UIColor.init(hexString: "#16384E")
                distanceSlider.isUserInteractionEnabled = true
//                distanceTextField.isUserInteractionEnabled = true
                distanceTextField.backgroundColor = UIColor.white
            }
        }
    }
    
    private func calculateForce() {
        forceLabel.text = String(format: "%.1f", customRound(dashboardModel.calculatedForceResult))
    }
    
    private func customRound(_ value: Double) -> Double {
        var result = value
        let count: Int = String(value).count - 2
        for i in stride(from: count, through: 1, by: -1) {
            let multiplier: Double = pow(10.0, Double(i))
            result = round(result * multiplier) / multiplier
        }
        
        return result
    }
    
    @IBAction func resetVLab(_ sender: Any) {
        massa1_Slider.value = Float(dashboardModel.defaultValue.first)
        massa1_Changed(massa1_Slider)
        massa2_Slider.value = Float(dashboardModel.defaultValue.second)
        massa2_Changed(massa2_Slider)
        distanceSlider.value = Float(dashboardModel.defaultValue.third)
        distanceChanged(distanceSlider)
        
        dashboardModel.reset()
        calculateForce()
    }
    
    @IBAction func playVLab(_ sender: Any) {
        playButton.isUserInteractionEnabled = false
        if virtualLabVM.isMission {
            guard let missions = virtualLabVM.missions as? [HukumNewtonMission] else { return }
            let currentMission = missions[virtualLabVM.indexMission]
            
            if customRound(dashboardModel.calculatedForceResult) == currentMission.forceValue {
                let successView: UIViewController
                let checkIndex: Bool = virtualLabVM.indexMission < missions.count
                successView = checkIndex ? EveryMission() : FinishMission()
                
                if !checkIndex {
                    (successView as! FinishMission).delegate = self
                }
                
                self.present(successView, animated: true) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                        if checkIndex {
//                            successView.dismiss(animated: true) {
//                                playButton.isUserInteractionEnabled = true
//                            }
                            playButton.isUserInteractionEnabled = true
                            virtualLabVM.indexMission += 1
                            if virtualLabVM.indexMission < missions.count {
                                
                                setUpMission()
                            }
                        }
                    }
                }
                
                if checkIndex {
                    let wordNumber = (virtualLabVM.indexMission + 1).convertToWord()
                    (successView as! EveryMission).delegate = self
                    (successView as! EveryMission).everyMissionLabel_1.text = "MISI \(wordNumber) SELESAI"
                    (successView as! EveryMission).everyMissionLabel_2.text = currentMission.explainationText
                    (successView as! EveryMission).everyMissionRumusImage.image = currentMission.explainationImage
                    if virtualLabVM.indexMission < missions.count - 1 {
                        (successView as! EveryMission).nextMissionButton.setTitle("Lanjut misi \((virtualLabVM?.indexMission)! + 2)", for: .normal)
                    } else {
                        (successView as! EveryMission).nextMissionButton.setTitle("Lanjutkan", for: .normal)
                    }
                    
                }
            } else if customRound(dashboardModel.calculatedForceResult) < currentMission.forceValue {
                self.view.isUserInteractionEnabled = false
                (currentVLab as! HukumNewtonScene).lepasOrbit()

                queue.async {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                        showFailView(text: "Gaya tarik gravitasi terlalu kecil sehingga matahari dan bumi terlepas dari orbit!")
                    }
                }
            } else {
                self.view.isUserInteractionEnabled = false
                (currentVLab as! HukumNewtonScene).modeOption = virtualLabVM.check
                (currentVLab as! HukumNewtonScene).bertabrakan()

                queue.async {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                        showFailView(text: "Gaya tarik gravitasi terlalu besar sehingga matahari dan bumi bertabrakan!")
                    }
                }
            }
        }
        
        calculateForce()
    }
    
    private func showFailView(text: String) {
        let failView = FailedMission()
        failView.text = text
        
        queue.async {
            DispatchQueue.main.async {
                if self.flagCancelIsTrue {
                    
                } else {
                    self.present(failView, animated: true) { [self] in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            (currentVLab as! HukumNewtonScene).reset()
                            failView.dismiss(animated: true) {
                                playButton.isUserInteractionEnabled = true
                            }
                            setUpMission()
                            view.isUserInteractionEnabled = true
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func showConceptTheory(_ sender: Any) {
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
    
    @IBAction func showInfoButton(_ sender: Any) {
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
        
        let experiment = virtualLabVM.experiment
        var labInstructionsContents: [Any] = []
        
        switch virtualLabVM.check {
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
    
    @IBAction func massa1_Changed(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        (currentVLab as! HukumNewtonScene).updateFirstPlanetMass(previous: dashboardModel.currentValue.first, current: Double(roundedValue))
        dashboardModel.currentValue.first = Double(roundedValue)
        massa1_TextField.text = String(format: "%.0f", roundedValue)
    }
    
    @IBAction func massa2_Changed(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        (currentVLab as! HukumNewtonScene).updateSecondPlanetMass(previous: dashboardModel.currentValue.second, current: Double(roundedValue))
        dashboardModel.currentValue.second = Double(roundedValue)
        massa2_TextField.text = String(format: "%.0f", roundedValue)
    }
    
    @IBAction func distanceChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        (currentVLab as! HukumNewtonScene).updateDistance(previous: dashboardModel.currentValue.third, current: Double(roundedValue))
        dashboardModel.currentValue.third = Double(roundedValue)
        distanceTextField.text = String(format: "%.0f", roundedValue)
    }
}
