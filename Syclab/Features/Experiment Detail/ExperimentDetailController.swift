//
//  ExperimentDetailController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit

class ExperimentDetailController: UIViewController {

    @IBOutlet weak var experimentDetailTitle: UILabel!
    @IBOutlet weak var experimentDetailStartButton: UIButton!
    @IBOutlet weak var experimentDetailLabel: UILabel!
    @IBOutlet weak var experimentDetailFirstView: UIView!
    @IBOutlet weak var experimentDetailFirstImageView: UIImageView!
    @IBOutlet weak var experimentDetailSecondView: UIView!
    @IBOutlet weak var experimentDetailSecondImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gerakParabola = ExperimentDetailRepository.shared.gerakParabola
        experimentDetailTitle.text = gerakParabola.title
        
        experimentDetailLabel.numberOfLines = 0
        experimentDetailLabel.attributedText = gerakParabola.description
        
        
        experimentDetailFirstImageView.image = gerakParabola.firstImage
        experimentDetailFirstImageView.contentMode = .scaleToFill
        
        experimentDetailFirstView.backgroundColor = .clear
        experimentDetailFirstView.layer.shadowColor = UIColor(hexString: "#35599B").cgColor
        experimentDetailFirstView.layer.shadowOpacity = 0.28
        experimentDetailFirstView.layer.shadowOffset = CGSize(width: 2, height: 2)
        experimentDetailFirstView.layer.shadowRadius = 2
        experimentDetailFirstView.layer.cornerRadius = 10
        
        experimentDetailSecondImageView.image = gerakParabola.secondImage
        experimentDetailSecondImageView.contentMode = .scaleToFill
        
        experimentDetailSecondView.backgroundColor = .clear
        experimentDetailSecondView.layer.shadowColor = UIColor(hexString: "#35599B").cgColor
        experimentDetailSecondView.layer.shadowOpacity = 0.28
        experimentDetailSecondView.layer.shadowOffset = CGSize(width: 2, height: 2)
        experimentDetailSecondView.layer.shadowRadius = 2
        experimentDetailSecondView.layer.cornerRadius = 10
        
        experimentDetailStartButton.setImage(UIImage(named: "MulaiButton"), for: .normal)
        experimentDetailStartButton.layer.shadowColor = UIColor(hexString: "#35599B").cgColor
        experimentDetailStartButton.layer.shadowOpacity = 0.28
        experimentDetailStartButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        experimentDetailStartButton.layer.shadowRadius = 2
        experimentDetailStartButton.layer.masksToBounds = false
    }
}
