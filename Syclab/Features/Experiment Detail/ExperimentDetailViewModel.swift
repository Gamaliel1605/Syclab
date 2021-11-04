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
    let check: String
    
    init(experiments: Experiments, check: String) {
        self.experiments = experiments
        self.navTitle = experiments.getExpTitle()
        self.check = check
    }
    
}
