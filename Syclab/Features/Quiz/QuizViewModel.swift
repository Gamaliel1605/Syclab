//
//  QuizViewModel.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import Foundation
import UIKit

class QuizViewModel {
    
    // MARK: - Quiz Data Array
    
    //Array pathway shortcut
    let experiment: Experiments
    let quizData: [ExperimentQuiz]
    let title: String
    
    init(experiment: Experiments) {
        self.experiment = experiment
        self.quizData = experiment.getQuiz()
        self.title = experiment.getExpTitle() 
        
    }
    
    // MARK: - Quiz Counter Properties
    
    var quizQuestionNumber = 0
    var quizScore = 0
}
