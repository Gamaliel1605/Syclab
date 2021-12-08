//
//  Experiments.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 31/10/21.
//

import UIKit

enum Experiments: String {
    case E1_GerakParabola = "Gerak Parabola",
         E2_HukumGravitasiNewton = "Hukum Gravitasi Newton",
         E3_GerakMelingkar = "Gerak Melingkar",
         E4_FluidaStatis = "Fluida Statis"
    
    static func getExpData() -> [Experiment] {
        return [E1_GerakParabolaData.experiment, E2_HukumGravitasiNewtonData.experiment, E3_GerakMelingkarData.experiment, E4_FluidaStatisData.experiment]
    }
    
    func getExpTitle() -> String{
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.experiment.expTitle
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.experiment.expTitle
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.experiment.expTitle
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.experiment.expTitle
        }
    }
    
    
    func getExpOptions() -> [ExperimentOption] {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.experimentOptions
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.experimentOptions
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.experimentOptions
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.experimentOptions
        }
    }
    
    func getEksplorasiDetail() -> ExperimentDetails {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.eksplorasiDetail
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.eksplorasiDetail
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.eksplorasiDetail
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.eksplorasiDetail
        }
    }
    
    func getMisiDetail() -> ExperimentDetails {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.misiDetail
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.misiDetail
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.misiDetail
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.misiDetail
        }
    }
    
    func getConceptTheory() -> ExperimentConcept {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.experimentConcept
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.experimentConcept
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.experimentConcept
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.experimentConcept
        }
    }
    
    func getExplorationLabInstruction() -> ExperimentLab {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.explorationLabInstructions
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.explorationLabInstructions
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.explorationLabInstructions
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.explorationLabInstructions
        }
    }
    
    func getMissionLabInstruction() -> ExperimentLab {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.missionLabInstructions
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.MissionLabInstructions
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.MissionLabInstructions
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.MissionLabInstructions
        }
    }
    
    func getMissions() -> [Any] {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.missions
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.missions
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.missions
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.missions
        }
    }
    
    func getQuiz() -> [ExperimentQuiz] {
        switch self {
        case .E1_GerakParabola:
            return E1_GerakParabolaData.quiz
        case .E2_HukumGravitasiNewton:
            return E2_HukumGravitasiNewtonData.quiz
        case .E3_GerakMelingkar:
            return E3_GerakMelingkarData.quiz
        case .E4_FluidaStatis:
            return E4_FluidaStatisData.quiz
        }
    }
}
