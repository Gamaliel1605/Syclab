//
//  FailedMission.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 10/11/21.
//

import Foundation
import UIKit

class FailedMission: UIViewController {
    
    @IBOutlet weak var failedView: UIView!
    @IBOutlet weak var imageFailed: UIImageView!
    @IBOutlet weak var labelFailed: UILabel!
    
    override func viewDidLoad() {
        
        failedView.layer.cornerRadius = 17
        super.viewDidLoad()
    }
}
