//
//  ExperimentDetailViewModel.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import Foundation
import UIKit

class ExperimentDetailViewModel {
    
    let experiments: Experiments
    let navTitle: String
    let check: modeOption
    
    init(experiments: Experiments, check: modeOption) {
        self.experiments = experiments
        self.navTitle = experiments.getExpTitle()
        self.check = check
    }
    
}

enum modeOption: String {
    case Eksplorasi = "Eksplorasi",
         Misi = "Misi",
         Kuis = "Kuis"
}
