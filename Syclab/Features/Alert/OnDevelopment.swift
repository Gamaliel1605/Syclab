//
//  OnDevelopment.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 08/12/21.
//

import Foundation
import UIKit

class OnDevelopment: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var closeView: UIView!
    
    override func viewDidLoad() {
        
        self.cardView.layer.cornerRadius = 10
        self.closeView.layer.cornerRadius = 10
        super.viewDidLoad()
    }
    @IBAction func closeAlert(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
