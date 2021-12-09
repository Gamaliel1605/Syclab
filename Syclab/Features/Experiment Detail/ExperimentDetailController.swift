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
    
    var experimentVM: ExperimentDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = experimentVM.navTitle
        setUp()
    }
    
    private func setUp() {
        var experimentDetails: ExperimentDetails
        var title: String
        
        if experimentVM.check == .Eksplorasi {
            experimentDetails = experimentVM.experiment.getEksplorasiDetail()
            title = "Mode Eksplorasi"
        } else {
            experimentDetails = experimentVM.experiment.getMisiDetail()
            title = "Mode Misi"
        }
        
        experimentDetailTitle.text = title
        
        experimentDetailLabel.numberOfLines = 0
        experimentDetailLabel.attributedText = experimentDetails.expDesc
        experimentDetailLabel.adjustsFontSizeToFitWidth = true
        experimentDetailLabel.lineBreakMode = .byTruncatingTail
        
        experimentDetailFirstImageView.image = UIImage(named: experimentDetails.expImage_1)
        experimentDetailFirstImageView.contentMode = .scaleToFill
        
        experimentDetailFirstView.backgroundColor = .clear
        experimentDetailFirstView.layer.shadowColor = UIColor(hexString: "#35599B").cgColor
        experimentDetailFirstView.layer.shadowOpacity = 0.28
        experimentDetailFirstView.layer.shadowOffset = CGSize(width: 2, height: 2)
        experimentDetailFirstView.layer.shadowRadius = 2
        experimentDetailFirstView.layer.cornerRadius = 10
        
        experimentDetailSecondImageView.image = UIImage(named: experimentDetails.expImage_2)
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
    
    
    @IBAction func labButton(_ sender: UIButton) {
        switch experimentVM.experiment {
        case .E1_GerakParabola:
            let VC = UIStoryboard.init(name: "VirtualLab", bundle: Bundle.main).instantiateViewController(withIdentifier: "virtualLab") as! VirtualLabController
            VC.virtualLabVM = VirtualLabViewModel(check: experimentVM.check, experiment: experimentVM.experiment)
            self.navigationController?.pushViewController(VC, animated: true)
            
        case .E2_HukumGravitasiNewton:
            let VC = UIStoryboard.init(name: "VirtualLabHukumNewton", bundle: Bundle.main).instantiateViewController(withIdentifier: "hukumNewton") as! VirtualLabHukumNewtonViewController
            VC.virtualLabVM = VirtualLabViewModel(check: experimentVM.check, experiment: experimentVM.experiment)
            self.navigationController?.pushViewController(VC, animated: true)
        
        case .E3_GerakMelingkar:
            let VC = UIStoryboard.init(name: "VirtualLab", bundle: Bundle.main).instantiateViewController(withIdentifier: "virtualLab") as! VirtualLabController
            VC.virtualLabVM = VirtualLabViewModel(check: experimentVM.check, experiment: experimentVM.experiment)
            self.navigationController?.pushViewController(VC, animated: true)
        
        case .E4_FluidaStatis:
            let VC = UIStoryboard.init(name: "VirtualLab", bundle: Bundle.main).instantiateViewController(withIdentifier: "virtualLab") as! VirtualLabController
            VC.virtualLabVM = VirtualLabViewModel(check: experimentVM.check, experiment: experimentVM.experiment)
            self.navigationController?.pushViewController(VC, animated: true)
            
        }
    }
}
