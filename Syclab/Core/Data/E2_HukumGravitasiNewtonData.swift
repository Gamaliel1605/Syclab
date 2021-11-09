//
//  E2_HukumGravitasiNewton.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 31/10/21.
//

import Foundation

struct E2_HukumGravitasiNewtonData {
    
    static let experiment = Experiment(
        expTitle: "Hukum Gravitasi Newon",
        expImage: "placeholder",
        id: .E2_HukumGravitasiNewton
    )
    
    static let eksplorasiDetail = ExperimentDetails(expDesc: "ini eksploras",
                                                    expImage_1: "GerakParabola_description_1",
                                                    expImage_2: "GerakParabola_description_2")
    
    static let misiDetail = ExperimentDetails(expDesc: "ini misi",
                                                    expImage_1: "GerakParabola_description_1",
                                                    expImage_2: "GerakParabola_description_2")
    
    static let experimentOptions = [ExperimentOption(title: .Eksplorasi,
                                                      desc: "Eksplor dan Coba Eksperimen",
                                                      imgName: "modeplaceholder"),
                                    ExperimentOption(title: .Misi,
                                                      desc: "Selesaikan misi yang diberikan",
                                                      imgName: "modeplaceholder"),
                                    ExperimentOption(title: .Kuis,
                                                      desc: "Kerjakan kuis untuk uji pemahanamu",
                                                      imgName: "modeplaceholder")]
    
    static let missions = ["sssss", "asdda"]
    
    static let quiz = [
        ExperimentQuiz(
            quizImage: "missionplaceholder", quizQuestion: "Content coming soon", quizOptionA: "Content coming soon", quizOptionB: "Content coming soon", quizOptionC: "Content coming soon", quizOptionD: "Content coming soon", quizAnswer: "Content coming soon", quizExplanation: "Content coming soon"
        ),
        ExperimentQuiz(
            quizImage: "missionplaceholder", quizQuestion: "Content coming soon", quizOptionA: "Content coming soon", quizOptionB: "Content coming soon", quizOptionC: "Content coming soon", quizOptionD: "Content coming soon", quizAnswer: "Content coming soon", quizExplanation: "Content coming soon"
        ),
        ExperimentQuiz(
            quizImage: "missionplaceholder", quizQuestion: "Content coming soon", quizOptionA: "Content coming soon", quizOptionB: "Content coming soon", quizOptionC: "Content coming soon", quizOptionD: "Content coming soon", quizAnswer: "Content coming soon", quizExplanation: "Content coming soon"
        ),
        ExperimentQuiz(
            quizImage: "missionplaceholder", quizQuestion: "Content coming soon", quizOptionA: "Content coming soon", quizOptionB: "Content coming soon", quizOptionC: "Content coming soon", quizOptionD: "Content coming soon", quizAnswer: "Content coming soon", quizExplanation: "Content coming soon"
        ),
        ExperimentQuiz(
            quizImage: "missionplaceholder", quizQuestion: "Content coming soon", quizOptionA: "Content coming soon", quizOptionB: "Content coming soon", quizOptionC: "Content coming soon", quizOptionD: "Content coming soon", quizAnswer: "Content coming soon", quizExplanation: "Content coming soon"
        )
    ]
}
