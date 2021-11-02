//
//  QuizController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit

class QuizController: UIViewController {

    @IBOutlet weak var quizScrollView: UIScrollView!
    
    @IBOutlet weak var quizQuestionImage: UIImageView!
    @IBOutlet weak var quizQuestionLabel: UILabel!
    
    @IBOutlet weak var quizOptionA_Button: UIButton!
    @IBOutlet weak var quizOptionB_Button: UIButton!
    @IBOutlet weak var quizOptionC_Button: UIButton!
    @IBOutlet weak var quizOptionD_Button: UIButton!
    
    @IBOutlet weak var quizDynamicView: UIView!
    @IBOutlet weak var quizAnswerLabel: UILabel!
    @IBOutlet weak var quizAnswerExplanationLabel: UILabel!
    
    @IBOutlet weak var quizQuestionTrackerLabel: UILabel!
    @IBOutlet weak var quizProceedButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func quizAnswerChosen(_ sender: UIButton) {
        
    }
    
    @IBAction func quizProceeded(_ sender: UIButton) {
        
    }
    
    func updateUI() {
        //cardView.layer.cornerRadius = 11
        
    }
    
}
