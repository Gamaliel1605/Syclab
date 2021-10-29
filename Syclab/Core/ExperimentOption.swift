//
//  ExperimentOption.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 29/10/21.
//

import Foundation
import UIKit

class ExperimentOption {
    
    var expPlayground: String
    var expMission: String
    var expQuiz: String
    
    init(expPlayground: String, expMission: String, expQuiz: String) {
        self.expPlayground = expPlayground
        self.expMission = expMission
        self.expQuiz = expQuiz
    }
}
