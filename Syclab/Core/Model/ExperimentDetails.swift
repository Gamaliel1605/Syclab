//
//  ExperimentDetail.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 29/10/21.
//

import Foundation
import UIKit

class ExperimentDetails {
    
    var expDesc: [Any]
    var expImage_1: String
    var expImage_2: String
    
    init(expDesc: [Any], expImage_1: String, expImage_2: String) {
        self.expDesc = expDesc
        self.expImage_1 = expImage_1
        self.expImage_2 = expImage_2
    }
}
