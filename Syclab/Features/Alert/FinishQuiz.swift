//
//  FinishQuiz.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 02/11/21.
//

import Foundation
import UIKit

protocol QuizAlertProtocol: AnyObject {
    func onTapKeluarQuiz()
}

class FinishQuiz: UIViewController {
    
    @IBOutlet weak var quizView: UIView!
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizLabel_1: UILabel!
    @IBOutlet weak var quizScore: UILabel!
    @IBOutlet weak var quizLabel_2: UILabel!
    @IBOutlet weak var quizLabel_3: UILabel!
    @IBOutlet weak var buttonKeluar: DesignableButton!
    
    weak var delegate: QuizAlertProtocol?
    
    var quizVM: QuizViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizView.layer.cornerRadius = 17
        quizScore.text = "Score: \("")"
        quizLabel_3.text = "menyelesaikan kuis materi \("")!"
    }
    
    @IBAction func keluarTapped(_ sender: Any) {
        
//        self.dismiss(animated: true, completion: nil)
        delegate?.onTapKeluarQuiz()
    }
    
}
