//
//  VirtualLabController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit
import SpriteKit
class VirtualLabController: UIViewController, GravityPopoverDelegate {
   
    @IBOutlet weak var instructionButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var jalankanButton: UIButton!
    @IBOutlet weak var gravitationButton: UIButton!
    @IBOutlet weak var varLbl1: UILabel!
    @IBOutlet weak var varSlider1: UISlider!
    @IBOutlet weak var varLbl2: UILabel!
    @IBOutlet weak var varSlider2: UISlider!
    @IBOutlet weak var varTextField2: UITextField!
    @IBOutlet weak var varTextField1: UITextField!
    @IBOutlet weak var unitLbl1: UILabel!
    @IBOutlet weak var unitLbl2: UILabel!
    @IBOutlet weak var spriteView: SKView!
    let button:UIButton = UIButton(type: UIButton.ButtonType.custom)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "Eksperimen Gerak Parabola"
        
        setupControlPanel()
        
        
        instructionButton.layer.cornerRadius = 15
        instructionButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        infoButton.layer.cornerRadius = 15
        infoButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//
//        instructionButton.roundCorners(corners:[.bottomLeft, .bottomRight], radius: 15)
//
//
//        infoButton.roundCorners(corners: [.topLeft, .topRight], radius: 15)
//
    }
    
    // MARK: - Pressed Button Function
    
    @objc func buttonAction(sender: UIButton!) {
            print("oi asw")
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
    }
    
    // MARK: - SETUP UI
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupGravitationButton() {
        
    }
    
    func setupTheoryButton() {
        let imageSize:CGSize = CGSize(width: 30, height: 30)
        button.frame = CGRect(x: (jalankanButton.layer.position.x) - 35, y: (jalankanButton.layer.position.y + (1-0.284173) * view.bounds.height) + 35 + 15, width: 70, height: 70)
        button.setImage(UIImage(systemName: "book.closed.fill"), for: UIControl.State.normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(
            top: (button.frame.size.height - imageSize.height) / 4,
            left: (button.frame.size.width - imageSize.width) / 4,
            bottom: (button.frame.size.height - imageSize.height) / 4,
            right: (button.frame.size.width - imageSize.width) / 4)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = .yellow
        self.view.addSubview(button)
    }
    
    func setupControlPanel() {
        setupGravitationButton()
        setupTheoryButton()
        setupIntrucButton()
    }
    
    func setupIntrucButton() {
        instructionButton.setTitle("", for: .normal)
    }
    
    func setupInfoButon() {
//        let imageSize:CGSize = CGSize(width: 100, height: 100)
//        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
//        infoButton.contentVerticalAlignment = .fill
//        infoButton.contentHorizontalAlignment = .fill
//
//        infoButton.imageEdgeInsets = UIEdgeInsets(
//            top: (infoButton.frame.size.height - imageSize.height) / 4,
//            left: (infoButton.frame.size.width - imageSize.width) / 4,
//            bottom: (infoButton.frame.size.height - imageSize.height) / 4,
//            right: (infoButton.frame.size.width - imageSize.width) / 4)
//        infoButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    
    // MARK: - PROTOCOL
    func chooseGravity(chosenValue planet: Planet) {
        gravitationButton.setTitle(planet.rawValue + " \(planet.getGravityValue()) m/s²", for: .normal)
        print("juancog")
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
