//
//  ModeOptionViewModel.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import Foundation
import UIKit

class ModeOptionViewModel {
    let experiment: Experiments
    let title: String
    let experimentOptions: [ExperimentOption]
    
    init(experiment: Experiments) {
        self.experiment = experiment
        self.title = experiment.getExpTitle()
        self.experimentOptions = experiment.getExpOptions()
    }
    
}
