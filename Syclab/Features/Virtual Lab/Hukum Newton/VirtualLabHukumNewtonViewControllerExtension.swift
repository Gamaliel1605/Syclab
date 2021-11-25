//
//  VirtualLabHukumNewtonViewControllerExtension.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 19/11/21.
//

import UIKit

extension VirtualLabHukumNewtonViewController: FinishAlertProtocol {
    func onTapKeluarFinish() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func onTapToQuiz() {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "quiz") as! QuizController
        newVC.quizVM = QuizViewModel(experiment: virtualLabVM.experiment)
        
        var VCArray = self.navigationController?.viewControllers
        VCArray?.removeLast()
        VCArray?.removeLast()
        VCArray?.append(newVC)
        self.navigationController?.setViewControllers(VCArray!, animated: false)
    }
}