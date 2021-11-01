//
//  Experiment.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 29/10/21.
//

import Foundation
import UIKit

class Experiment {
    
    let id: Experiments
    var expTitle: String
    var expImage: String
    
    init(expTitle: String, expImage: String, id: Experiments) {
        self.expTitle = expTitle
        self.expImage = expImage
        self.id = id
    }
}
