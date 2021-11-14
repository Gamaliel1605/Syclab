//
//  VirtualLabHukumNewtonViewController.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 13/11/21.
//

import UIKit
import SpriteKit

class VirtualLabHukumNewtonViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var conceptTheoryButton: UIButton!
    @IBOutlet weak var massa1_TextField: UITextField!
    @IBOutlet weak var massa2_TextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var HukumNewtonSKView: SKView!
    
    let step: Float = 1
    var dashboardModel: DashboardModel!
    var currentVLab: SKScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDasboardView()
        setUpSKView()
    }

    private func setUpDasboardView() {
        resetButton.layer.cornerRadius = 20
        playButton.layer.cornerRadius = 20
        conceptTheoryButton.layer.cornerRadius = 20
        dashboardModel = HukumNewtonDashboardModel(firstValue: 1, secondValue: 1, thirdValue: 10)
    }
    
    private func setUpSKView() {
        let scene = HukumNewtonScene(size: HukumNewtonSKView.bounds.size)
        scene.scaleMode = .aspectFill
        HukumNewtonSKView.presentScene(scene)
        currentVLab = scene
    }
    
    @IBAction func resetVLab(_ sender: Any) {
        
    }
    
    @IBAction func playVLab(_ sender: Any) {
        
    }
    
    @IBAction func showConceptTheory(_ sender: Any) {
        
    }
    
    @IBAction func massa1_Changed(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        (currentVLab as! HukumNewtonScene).updateFirstPlanetMass(previous: dashboardModel.firstValue, current: roundedValue)
        dashboardModel.firstValue = roundedValue
        massa1_TextField.text = String(format: "%.0f", roundedValue)
    }
    
    @IBAction func massa2_Changed(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        (currentVLab as! HukumNewtonScene).updateSecondPlanetMass(previous: dashboardModel.secondValue, current: roundedValue)
        dashboardModel.secondValue = roundedValue
        massa2_TextField.text = String(format: "%.0f", roundedValue)
    }
    
    @IBAction func distanceChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        (currentVLab as! HukumNewtonScene).updateDistance(previous: dashboardModel.thirdValue, current: roundedValue)
        dashboardModel.thirdValue = roundedValue
        distanceTextField.text = String(format: "%.0f", roundedValue)
    }
}
