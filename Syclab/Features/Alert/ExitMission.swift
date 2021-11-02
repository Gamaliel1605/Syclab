//
//  ExitMission.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 02/11/21.
//

import Foundation
import UIKit

protocol ExitAlertProtocol: AnyObject{
    func onTapKeluar()
}

class ExitMission: UIViewController {
    
    @IBOutlet weak var exitView: UIView!
    @IBOutlet weak var exitLabel_1: UILabel!
    @IBOutlet weak var exitLabel_2: UILabel!
    @IBOutlet weak var buttonBatal: DesignableButton!
    @IBOutlet weak var buttonKeluar: DesignableButton!
    
    weak var delegate: ExitAlertProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exitView.layer.cornerRadius = 17
    }
    
    @IBAction func batalTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func keluarTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        delegate?.onTapKeluar()
    }
    
}
