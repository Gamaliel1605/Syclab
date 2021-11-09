//
//  QuizController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit

class QuizController: UIViewController, QuizAlertProtocol {

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
    
    var quizVM: QuizViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func quizAnswerChosen(_ sender: UIButton) {
        //Button Disabling and Enabling
        quizOptionA_Button.isUserInteractionEnabled = false
        quizOptionB_Button.isUserInteractionEnabled = false
        quizOptionC_Button.isUserInteractionEnabled = false
        quizOptionD_Button.isUserInteractionEnabled = false
        
        var userAnswer = sender.currentTitle!
        let userGotItRight = checkAnswer(userAnswer)

        print("\(userAnswer)")
        userAnswer = quizVM.quizData[quizVM.quizQuestionNumber].quizAnswer

        print("\(quizVM.quizData[quizVM.quizQuestionNumber].quizAnswer)")
        print("\(quizVM.quizScore)")

        if userGotItRight {
            sender.tintColor = UIColor(hexString: "5AB861")
            print("Benar")
        } else {
            sender.tintColor = UIColor(hexString: "BF2727")
            print("Salah")
            //the correct button becomes green
            if userAnswer == quizVM.quizData[quizVM.quizQuestionNumber].quizOptionA {
                quizOptionA_Button.tintColor = UIColor(hexString: "5AB861")
            }
            if userAnswer == quizVM.quizData[quizVM.quizQuestionNumber].quizOptionB {
                quizOptionB_Button.tintColor = UIColor(hexString: "5AB861")
            }
            if userAnswer == quizVM.quizData[quizVM.quizQuestionNumber].quizOptionC {
                quizOptionC_Button.tintColor = UIColor(hexString: "5AB861")
            }
            if userAnswer == quizVM.quizData[quizVM.quizQuestionNumber].quizOptionD {
                quizOptionD_Button.tintColor = UIColor(hexString: "5AB861")
            }
        }

        if quizVM.quizQuestionNumber == ((quizVM.quizData.count) - 1) {
            quizProceedButton.setTitle("Selesai", for: .normal)
        } else {
            quizProceedButton.setTitle("Lanjut", for: .normal)
        }
        quizProceedButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold) //not working

        quizAnswerLabel.attributedText = NSMutableAttributedString()
            .normal("Jawaban:    ")
            .bold("\(quizVM.quizData[quizVM.quizQuestionNumber].quizAnswer)")
        quizAnswerExplanationLabel.text = quizVM.quizData[quizVM.quizQuestionNumber].quizExplanation
        quizProceedButton.alpha = 1
        quizDynamicView.alpha = 1

        //automated bottom scroll
        quizScrollView.scrollToBottom()
    }
    
    @IBAction func quizProceeded(_ sender: UIButton) {
        if quizVM.quizQuestionNumber == ((quizVM.quizData.count) - 1) {
            //where the Quiz (and other variables) restarts -> transition to alert
            quizVM.quizQuestionNumber = 0
            
            self.navigationController?.isNavigationBarHidden = true
            quizScrollView.isScrollEnabled = false
            quizProceedButton.isUserInteractionEnabled = false
            self.view.alpha = 0.5
           
            let quizAlert = FinishQuiz()
            quizAlert.delegate = self
            self.present(quizAlert, animated: true, completion: nil)
            
            quizAlert.quizScore.text = "Score: \(quizVM.quizScore)"
            quizAlert.quizLabel_3.text = "menyelesaikan kuis materi \(quizVM.title)!"
            
        } else {
            //automated top scroll
            quizScrollView.scrollToTop()

            nextQuestion()
            updateUI()
        }
    }
    
    func onTapKeluarQuiz() {
        print("onTapKeluarKuis")
        
        self.navigationController?.isNavigationBarHidden = false
//        dismiss(animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "goToHome") as! HomeController
//        self.navigationController?.pushViewController(vc, animated: true)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func updateUI() {
        quizQuestionImage.image = UIImage(named: quizVM.quizData[quizVM.quizQuestionNumber].quizImage)

        quizQuestionLabel.text = quizVM.quizData[quizVM.quizQuestionNumber].quizQuestion

        quizOptionA_Button.setTitle(quizVM.quizData[quizVM.quizQuestionNumber].quizOptionA, for: .normal)

        quizOptionB_Button.setTitle(quizVM.quizData[quizVM.quizQuestionNumber].quizOptionB, for: .normal)

        quizOptionC_Button.setTitle(quizVM.quizData[quizVM.quizQuestionNumber].quizOptionC, for: .normal)

        quizOptionD_Button.setTitle(quizVM.quizData[quizVM.quizQuestionNumber].quizOptionD, for: .normal)

        quizQuestionTrackerLabel.text = "Soal \(quizVM.quizQuestionNumber + 1) dari \(quizVM.quizData.count)"

        quizProceedButton.setTitle("Lanjut", for: .disabled)
        quizProceedButton.alpha = 0
        quizDynamicView.alpha = 0

        //Button Disabling and Enabling
        quizOptionA_Button.isUserInteractionEnabled = true
        quizOptionB_Button.isUserInteractionEnabled = true
        quizOptionC_Button.isUserInteractionEnabled = true
        quizOptionD_Button.isUserInteractionEnabled = true

        //button colour reset
        quizOptionA_Button.tintColor = UIColor(hexString: "16384E")
        quizOptionB_Button.tintColor = UIColor(hexString: "16384E")
        quizOptionC_Button.tintColor = UIColor(hexString: "16384E")
        quizOptionD_Button.tintColor = UIColor(hexString: "16384E")
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizVM.quizData[quizVM.quizQuestionNumber].quizAnswer {
            quizVM.quizScore += 20
            return true
        } else {
            return false
        }
    }
    
    func nextQuestion() {
        if quizVM.quizQuestionNumber + 1 < quizVM.quizData.count {
            quizVM.quizQuestionNumber += 1
        }
    }
}

// MARK: - Extentions

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        setContentOffset(bottomOffset, animated: true)
    }
}
        
extension NSMutableAttributedString {
    var fontSize:CGFloat { return 27 }
    var boldFont:UIFont { return UIFont(name: "SFProDisplay-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "SFProDisplay-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue
            
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}

