//
//  E1_GerakParabola.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 31/10/21.
//

import Foundation

struct E1_GerakParabolaData {
    
    
    static let experiment = Experiment(
        expTitle: "Gerak Parabola"  ,
        expImage: "placeholder",
        id: .E1_GerakParabola
    )
    
    static let experimentOption = ExperimentOption(expPlaygroundTitle: "Eksplorasi",
                                             expPlaygroundImage: "placeholder",
                                             expPlaygroundDesc: "Eksplor dan Coba Eksperimen",
                                             expMissionTitle: "Misi",
                                             expMissionImage: "placeholder",
                                             expMissionDesc: "Selesaikan Misi yang diberikan",
                                             expQuizTitle: "Kuis",
                                             expQuizImage: "placeholder",
                                             expQuizDesc: "Kerjakan kuis untuk uji pemahamanmu")
    
    static let eksplorasiDetail = ExperimentDetails(expDesc: ["ini eksploras", "yowowo"],
                                                    expImage_1: "GerakParabola_description_1",
                                                    expImage_2: "GerakParabola_description_2")
    
    static let misiDetail = ExperimentDetails(expDesc: ["ini misi", "yowowo"],
                                                    expImage_1: "GerakParabola_description_1",
                                                    expImage_2: "GerakParabola_description_2")
    static let experimentOptions = [ExperimentOptionA(title: "Eksplorasi",
                                                      desc: "Eksplor dan Coba Eksperimen",
                                                      imgName: "modeplaceholder"),
                                    ExperimentOptionA(title: "Misi",
                                                      desc: "Selesaikan misi yang diberikan",
                                                      imgName: "modeplaceholder"),
                                    ExperimentOptionA(title: "Kuis",
                                                      desc: "Kerjakan kuis untuk uji pemahanamu",
                                                      imgName: "modeplaceholder")]
    
                                                        
//                                                        (expPlaygroundTitle: "Eksplorasi",
//                                                                                   expPlaygroundImage: "placeholder",
//                                                                                   expPlaygroundDesc: "Eksplor dan Coba Eksperimen",
//                                                                                   expMissionTitle: "Misi",
//                                                                                   expMissionImage: "placeholder",
//                                                                                   expMissionDesc: "Selesaikan Misi yang diberikan",
//                                                                                   expQuizTitle: "Kuis",
//                                                                                   expQuizImage: "placeholder",
//                                                                                   expQuizDesc: "Kerjakan kuis untuk uji pemahamanmu")
}
