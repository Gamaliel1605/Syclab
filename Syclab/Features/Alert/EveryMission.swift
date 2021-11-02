//
//  EveryMission.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 02/11/21.
//

import Foundation
import UIKit

protocol EveryMissionAlertProtocol: AnyObject {
    
}

class EveryMission: UIViewController {
    
    @IBOutlet weak var everyMissionView: UIView!
    @IBOutlet weak var everyMissionImage: UIImageView!
    @IBOutlet weak var everyMissionLabel_1: UILabel!
    @IBOutlet weak var everyMissionLabel_2: UILabel!
    
    weak var delegate: EveryMissionAlertProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        everyMissionView.layer.cornerRadius = 17
        everyMissionView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
}
