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
        flagCancelIsTrue = false
        queue.resume()
    }
    
    func onTapKeluar() {
        currentVLab.isPaused = false
        flagCancelIsTrue = true
        queue.resume()
        self.navigationController?.popViewController(animated: true)
    }
}


extension VirtualLabHukumNewtonViewController: EveryMissionAlertProtocol {
    func onTapNextMission() {
        if virtualLabVM!.indexMission < (virtualLabVM?.missions!.count)!  {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
            let finishAlert = FinishMission()
            self.present(finishAlert, animated: true, completion: nil)
            finishAlert.delegate = self
        }
        
    }
}
