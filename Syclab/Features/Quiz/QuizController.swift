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
    
    var quizVM: QuizViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomQuizIdentifierGenerator()
        updateUI()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
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
        // "redefining" userAnswer (to the correct one) for a more concise "button colouring" logic
        userAnswer = quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizAnswer

        print("\(quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizAnswer)")
        print("\(quizVM.quizScore)")

        if userGotItRight {
            sender.backgroundColor = UIColor(hexString: "5AB861")
            print("Benar")
        } else {
            sender.backgroundColor = UIColor(hexString: "BF2727")
            print("Salah")
            //the correct button becomes green
            if userAnswer == quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizOptionA {
                quizOptionA_Button.backgroundColor = UIColor(hexString: "5AB861")
            }
            if userAnswer == quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizOptionB {
                quizOptionB_Button.backgroundColor = UIColor(hexString: "5AB861")
            }
            if userAnswer == quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizOptionC {
                quizOptionC_Button.backgroundColor = UIColor(hexString: "5AB861")
            }
            if userAnswer == quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizOptionD {
                quizOptionD_Button.backgroundColor = UIColor(hexString: "5AB861")
            }
        }

        // Quiz "Proceed" button UI
        if quizVM.quizQuestionNumber == ((quizVM.quizData.count) - 1) {
            quizProceedButton.setTitle("Selesai", for: .normal)
        } else {
            quizProceedButton.setTitle("Lanjut", for: .normal)
        }
        quizProceedButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)

        quizAnswerLabel.attributedText = NSMutableAttributedString()
            .normal("Jawaban:    ")
            .bold("\(quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizAnswer)")
//        quizAnswerExplanationLabel.text = quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizExplanation
        quizProceedButton.alpha = 1
        quizDynamicView.alpha = 1
        
        let explanationView = UIView()
        explanationView.tag = 1000
        quizDynamicView.addSubview(explanationView)
        explanationView.translatesAutoresizingMaskIntoConstraints = false
        explanationView.topAnchor.constraint(equalTo: quizDynamicView.topAnchor).isActive = true
        explanationView.leadingAnchor.constraint(equalTo: quizDynamicView.leadingAnchor).isActive = true
        explanationView.trailingAnchor.constraint(equalTo: quizDynamicView.trailingAnchor).isActive = true
        explanationView.bottomAnchor.constraint(equalTo: quizDynamicView.bottomAnchor).isActive = true
        explanationView.widthAnchor.constraint(equalTo: quizDynamicView.widthAnchor).isActive = true
        
        var elements = [UIView]()
        
        guard let experiment = quizVM?.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]] else {return}
        let explanationContent = experiment.quizExplanation
        for (index, content) in explanationContent.enumerated() {
            if (content is ContentImage) {
                let imageView = (content as! ContentImage).create(
                    elementsContainer: explanationView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: explanationContent.endIndex - 1
                )
                elements.append(imageView)
            } else if (content is ContentLabel) {
                let label = (content as! ContentLabel).create(
                    elementsContainer: explanationView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: explanationContent.endIndex - 1
                )
                elements.append(label)
            }
        }

        //automated bottom scroll
        quizScrollView.scrollToBottom()
    }
    
    @IBAction func quizProceeded(_ sender: UIButton) {
        if quizVM.quizQuestionNumber == ((quizVM.quizData.count) - 1) {
            //where the Quiz (and other variables) restarts -> transition to alert
            quizVM.quizQuestionNumber = 0 // Do not know how it restarts itself; this snippet does nothing
            
            self.navigationController?.isNavigationBarHidden = true
            quizScrollView.isScrollEnabled = false
            quizProceedButton.isUserInteractionEnabled = false
            self.view.alpha = 0.5
           
            let quizAlert = FinishQuiz()
            quizAlert.delegate = self
            self.present(quizAlert, animated: true, completion: nil)
            
            // Quiz "Completion Alert" UI
            if Float(quizVM.quizScore)/Float(quizVM.quizData.count) < 0.5 {
                quizAlert.quizLabel_1.text = "Ayo coba lagi!"
                quizAlert.quizLabel_2.text = "Kamu bisa mencoba lagi"
            } else {
                quizAlert.quizLabel_1.text = "Selamat!"
                quizAlert.quizLabel_2.text = "Kamu telah berhasil"
            }
            quizAlert.quizScore.text = "Skor: \(quizVM.quizScore) dari \(quizVM.quizData.count)"
            quizAlert.quizLabel_3.text = "menyelesaikan kuis materi \(quizVM.title)!"
            
            quizVM.quizScore = 0 // Do not know how it restarts itself; this snippet does nothing
            
        } else {
            //automated top scroll
            quizScrollView.scrollToTop()

            nextQuestion()
            updateUI()
        }
    }
    
    func updateUI() {
        quizQuestionImage.image = UIImage(named: quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizImage)

        quizQuestionLabel.text = quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizQuestion

        quizOptionA_Button.setTitle(quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizOptionA, for: .normal)

        quizOptionB_Button.setTitle(quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizOptionB, for: .normal)

        quizOptionC_Button.setTitle(quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizOptionC, for: .normal)

        quizOptionD_Button.setTitle(quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizOptionD, for: .normal)

        quizQuestionTrackerLabel.text = "Soal \(quizVM.quizQuestionNumber + 1) dari \(quizVM.quizData.count)"

        quizProceedButton.setTitle("Lanjut", for: .disabled)
        quizProceedButton.alpha = 0
        quizDynamicView.alpha = 0
        
        for subview in quizDynamicView.subviews {
            if (subview.tag == 1000) {
                subview.removeFromSuperview()
            }
        }

        //Button Disabling and Enabling
        quizOptionA_Button.isUserInteractionEnabled = true
        quizOptionB_Button.isUserInteractionEnabled = true
        quizOptionC_Button.isUserInteractionEnabled = true
        quizOptionD_Button.isUserInteractionEnabled = true

        //Button Corner Roudering
        quizOptionA_Button.layer.cornerRadius = 10
        quizOptionB_Button.layer.cornerRadius = 10
        quizOptionC_Button.layer.cornerRadius = 10
        quizOptionD_Button.layer.cornerRadius = 10
        
        //Button Edge Insets
        quizOptionA_Button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        quizOptionB_Button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        quizOptionC_Button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        quizOptionD_Button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        //button colour reset
        quizOptionA_Button.backgroundColor = UIColor(hexString: "16384E")
        quizOptionB_Button.backgroundColor = UIColor(hexString: "16384E")
        quizOptionC_Button.backgroundColor = UIColor(hexString: "16384E")
        quizOptionD_Button.backgroundColor = UIColor(hexString: "16384E")
        
        //autoshrink text
        quizOptionA_Button.titleLabel?.adjustsFontSizeToFitWidth = true
        quizOptionB_Button.titleLabel?.adjustsFontSizeToFitWidth = true
        quizOptionC_Button.titleLabel?.adjustsFontSizeToFitWidth = true
        quizOptionD_Button.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
//        let quizScoreIncrementDeterminant = (100 / quizVM.quizData.count) -> Unused
        if userAnswer == quizVM.quizData[quizVM.randomQuizIdentifier[quizVM.quizQuestionNumber]].quizAnswer {
            quizVM.quizScore += 1
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
    
    func randomQuizIdentifierGenerator() {
        // a function for "dynamic" randomised array logic
        var counter = 0
        while counter < quizVM.quizData.count - 1 {
            counter += 1
            quizVM.randomQuizIdentifier.append(counter)
        }

        // shuffle once and iterate through the array using quizQuestionNumber (for avoiding repetition)
        quizVM.randomQuizIdentifier.shuffle()
        print(quizVM.randomQuizIdentifier)
    }
}

// MARK: - Extentions

extension QuizController: QuizAlertProtocol {
    func onTapKeluarQuiz() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.popViewController(animated: true)
        
    }
}

extension QuizController: ExitAlertProtocol {
    func onTapBatal() {
        print("ahaay")
    }
    
    func onTapKeluar() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func back(sender: UIBarButtonItem) {
        let exitAlert = Exit()
        exitAlert.delegate = self
        self.present(exitAlert, animated: true, completion: nil)
        
        exitAlert.exitLabel_1.text = "Tinggalkan quiz?"
    }
}

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

