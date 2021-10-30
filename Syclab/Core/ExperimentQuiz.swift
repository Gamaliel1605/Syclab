//
//  ExperimentQuiz.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 29/10/21.
//

import Foundation
import UIKit

class ExperimentQuiz {
    
    var quizImage: String
    var quizQuestion: String
    var quizAnswer: String
    var quizExplanation: String
    
    init(quizImage: String, quizQuestion: String, quizAnswer: String, quizExplanation: String) {
        self.quizImage = quizImage
        self.quizQuestion = quizQuestion
        self.quizAnswer = quizAnswer
        self.quizExplanation = quizExplanation
    }
}
