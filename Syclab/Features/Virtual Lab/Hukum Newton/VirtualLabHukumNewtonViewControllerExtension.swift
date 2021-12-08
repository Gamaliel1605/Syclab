//
//  VirtualLabHukumNewtonViewControllerExtension.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 19/11/21.
//

import UIKit

extension VirtualLabHukumNewtonViewController: DismissProtocol {
    func dismissView() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
}

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

extension VirtualLabHukumNewtonViewController: ExitAlertProtocol {
    func onTapBatal() {
        print("ahaay")
        currentVLab.isPaused = false
    }
    
    func onTapKeluar() {
        self.navigationController?.popViewController(animated: true)
    }
}
