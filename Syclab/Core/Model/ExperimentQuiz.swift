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
    var quizOptionA: String
    var quizOptionB: String
    var quizOptionC: String
    var quizOptionD: String
    var quizAnswer: String
    var quizExplanation: [Any]
    
    init(quizImage: String, quizQuestion: String, quizOptionA: String, quizOptionB: String, quizOptionC: String, quizOptionD: String, quizAnswer: String, quizExplanation: [Any]) {
        self.quizImage = quizImage
        self.quizQuestion = quizQuestion
        self.quizOptionA = quizOptionA
        self.quizOptionB = quizOptionB
        self.quizOptionC = quizOptionC
        self.quizOptionD = quizOptionD
        self.quizAnswer = quizAnswer
        self.quizExplanation = quizExplanation
    }
}
