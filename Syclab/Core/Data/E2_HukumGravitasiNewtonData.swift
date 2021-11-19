//
//  E2_HukumGravitasiNewton.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 31/10/21.
//

import Foundation
import UIKit

struct E2_HukumGravitasiNewtonData {
    
    static let experiment = Experiment(
        expTitle: "Hukum Gravitasi Newton",
        expImage: "HukumNewton",
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
                                                      imgName: "ModeEksplorasi"),
                                    ExperimentOption(title: .Misi,
                                                      desc: "Selesaikan misi yang diberikan",
                                                      imgName: "ModeMisi"),
                                    ExperimentOption(title: .Kuis,
                                                      desc: "Kerjakan kuis untuk uji pemahanamu",
                                                      imgName: "ModeKuis")]
    
    static let missions = [
        HukumNewtonMission(
            missionText: "Matahari dan Bumi terlalu jauh! Atur massa Matahari dan Bumi sehingga besar gaya tarik gravitasi antara kedua benda tersebut adalah sebesar 30 N agar mereka tidak terlepas dan keluar dari orbit",
            variables: [.firstMass, .secondMass],
            forceValue: 30
        ),
        HukumNewtonMission(
            missionText: "Matahari dan Bumi terlalu dekat! Atur jarak dan massa Matahari sehingga besar gaya tarik gravitasi antara kedua benda tersebut adalah sebesar 33.4 N agar mereka stabil dan tidak bertabrakan ataupun lepas dari orbit!",
            variables: [.distance, .firstMass],
            forceValue: 33.4
        )
    ]
    
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
    
    static let experimentConcept = ExperimentConcept(
        conceptTheory:
            [
                ContentLabel(
                    text: "Penjelasan Gaya Gravitasi",
                    alignment: .natural,
                    fontsize: 24,
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Pada tahun 1665, Newton menemukan bahwa gaya yang bertanggung jawab atas orbit Bulan adalah gravitasi. Gaya yang sama yang menahan kaki semua orang tetap menyentuh bumi. Saat itu Newton mendefinisikan gravitasi sebagai gaya yang menyebabkan adanya kecenderungan tiap objek untuk bergerak mendekati satu sama lain karena massa objek tersebut.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Persamaan Gaya Gravitasi",
                    alignment: .natural,
                    fontsize: 24,
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Newton merumuskan Hukum Gravitasi Newton sebagai berikut:",
                    alignment: .natural,
                    fontsize: 20,
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["rumus_newton","Rumus"],
                    padding: UIEdgeInsets(top: 15, left: 140, bottom: 0, right: 30),
                    size: CGSize(width: 477, height: 121)
                ),
                ContentLabel(
                    text: "Rumus ini menyatakan bahwa besar gravitasi yang dialami dua objek besarnya berbanding lurus dengan masa kedua objek dan berbanding terbalik secara eksponensial dengan jarak kedua objek tersebut. Artinya semakin besar massa kedua objek maka akan semakin besar pula massa gaya gravitasi, dan untuk setiap jarak yang bertambah antara dua objek penurunan gaya gravitasi akan terjadi secara eksponensial.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Konstanta gravitasi yang sangat kecil menyebabkan kita mendapatkan gravitasi yang “pas” dengan bumi dan objek disekitar kita.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["image_newton1","Illustrasi"],
                    padding: UIEdgeInsets(top: 15, left: 285, bottom: 0, right: 30),
                    size: CGSize(width: 222.19, height: 242)
                ),
                ContentLabel(
                    text: "Bayangkan apabila konstanta gravitasi nilainya cukup besar sehingga kamu harus menempel dengan setiap orang yang satu bus dengan kamu.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["image_newton2","Illustrasi"],
                    padding: UIEdgeInsets(top: 15, left: 280, bottom: 0, right: 30),
                    size: CGSize(width: 240.66, height: 242)
                ),
            ]
        )
    
}
