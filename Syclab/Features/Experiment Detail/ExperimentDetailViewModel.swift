//
//  ExperimentDetailViewModel.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import Foundation
import UIKit

class ExperimentDetailViewModel {
    
    let experiment: Experiments
    let navTitle: String
    let check: modeOption
    
    init(experiments: Experiments, check: modeOption) {
        self.experiment = experiments
        self.navTitle = experiments.getExpTitle()
        self.check = check
    }
    
}

enum modeOption: String {
    case Eksplorasi = "Eksplorasi",
         Misi = "Misi",
         Kuis = "Kuis"
}
