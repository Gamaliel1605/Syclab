//
//  FinishMission.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 02/11/21.
//

import Foundation
import UIKit

protocol FinishAlertProtocol: AnyObject {
    func onTapKeluarFinish()
}

class FinishMission: UIViewController {
    
    @IBOutlet weak var finishView: UIView!
    @IBOutlet weak var finishImage: UIImageView!
    @IBOutlet weak var finishLabel_1: UILabel!
    @IBOutlet weak var finishLabel_2: UILabel!
    @IBOutlet weak var finishLabel_3: UILabel!
    @IBOutlet weak var buttonQuiz: DesignableButton!
    @IBOutlet weak var buttonKeluar: DesignableButton!
    
    weak var delegate: FinishAlertProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishView.layer.cornerRadius = 17
    }
    
    @IBAction func quizTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func keluarTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate?.onTapKeluarFinish()
    }
}
