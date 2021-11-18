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
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var conceptTheoryButton: UIButton!
    
    @IBOutlet weak var massa1_TextField: UITextField!
    @IBOutlet weak var massa2_TextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var HukumNewtonSKView: SKView!
    
    let step: Float = 1
    let consGravity: Float = 10
    var dashboardModel: DashboardModel!
    var currentVLab: SKScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDasboardView()
        setUpSKView()
    }
    
    private func setUpDasboardView() {
        forceView.layer.cornerRadius = 10
        
        forceLabel.layer.backgroundColor = UIColor.init(white: 1, alpha: 0.5).cgColor
        forceLabel.layer.cornerRadius = 8
        forceLabel.layer.borderWidth = 0.5
        forceLabel.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        infoButton.layer.cornerRadius = 20
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
        let firstMassDefault: Float = 1
        let secondMassDefault: Float = 1
        let distanceDefault: Float = 10
        
        dashboardModel.firstValue = firstMassDefault
        dashboardModel.secondValue = secondMassDefault
        dashboardModel.thirdValue = distanceDefault
        
        massa1_Changed(self)
        massa2_Changed(self)
        distanceChanged(self)
    }
    
    @IBAction func playVLab(_ sender: Any) {
        let dashboardModel = (dashboardModel as! HukumNewtonDashboardModel)
        forceLabel.text = String(format: "%.0f", dashboardModel.calculatedForceResult)
    }
    
    @IBAction func showConceptTheory(_ sender: Any) {
        
    }
    
    @IBAction func massa1_Changed(_ sender: Any) {
        var roundedValue: Float
        if (sender is UISlider) {
            let sender = sender as! UISlider
            roundedValue = round(sender.value / step) * step
        }
        
        (currentVLab as! HukumNewtonScene).updateFirstPlanetMass(previous: dashboardModel.firstValue, current: roundedValue)
        dashboardModel.firstValue = roundedValue
        massa1_TextField.text = String(format: "%.0f", roundedValue)
    }
    
    @IBAction func massa2_Changed(_ sender: Any) {
        let roundedValue = round(sender.value / step) * step
        (currentVLab as! HukumNewtonScene).updateSecondPlanetMass(previous: dashboardModel.secondValue, current: roundedValue)
        dashboardModel.secondValue = roundedValue
        massa2_TextField.text = String(format: "%.0f", roundedValue)
    }
    
    @IBAction func distanceChanged(_ sender: Any) {
        let roundedValue = round(sender.value / step) * step
        (currentVLab as! HukumNewtonScene).updateDistance(previous: dashboardModel.thirdValue, current: roundedValue)
        dashboardModel.thirdValue = roundedValue
        distanceTextField.text = String(format: "%.0f", roundedValue)
    }
}
