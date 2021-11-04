//
//  Experiments.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 31/10/21.
//

import UIKit

enum Experiments: String {
    case E1_GerakParabola = "Gerak Parabola",
         E2_HukumGravitasiNewton = "Hukum Gravitasi Newton"
    
    static func getExpData() -> [Experiment] {
        return [E1_GerakParabolaData.experiment, E2_HukumGravitasiNewtonData.experiment]
    }
    
    func getExpTitle() -> String{
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.experiment.expTitle
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.experiment.expTitle
        }
    }
    
    
    func getExpOptions() -> [ExperimentOptionA] {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.experimentOptions
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.experimentOptions
        }
    }
    
    func getEksplorasiDetail() -> ExperimentDetails {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.eksplorasiDetail
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.eksplorasiDetail
        }
    }
    
    func getMisiDetail() -> ExperimentDetails {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.misiDetail
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.misiDetail
        }
    }
    
    func getConceptTheory() -> ExperimentConcept {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.experimentConcept
        case .E2_HukumGravitasiNewton:
            return ExperimentConcept(conceptTheory: [])
        }
    }
    
//    func getQuizzes() -> ExperimentQuiz{
//        switch self {
//
//        }
//    }
}

