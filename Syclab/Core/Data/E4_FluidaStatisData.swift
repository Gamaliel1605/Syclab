//
//  E4_FluidaStatisData.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 08/12/21.
//

import Foundation
import UIKit

struct E4_FluidaStatisData {
    
    static let experiment = Experiment(expTitle: "Fluida Statis",
                                       expImage: "FluidaStatis",
                                       id: .E4_FluidaStatis
    )
    
    static let eksplorasiDetail = ExperimentDetails(expDesc: """
                                            Gaya gravitasi adalah salah satu jenis gaya yang dipengaruhi oleh gaya tarik sebuah benda ke pusat benda tersebut.
                                            Tahukah kamu, bahwa gaya gravitasi dipengaruhi oleh massa benda dan jarak antar benda?
                                            
                                            Pada mode eksplorasi kali ini, kamu akan melihat dua benda yang terdapat pada tata surya kita yaitu matahari dan bumi. Keduanya akan memiliki gaya tarik yang berbeda tergantung kamu mencoba mengubah variabel tersebut nih kawan syclab. 
                                            Penasaran dengan apa yang terjadi jika kamu mengubah massa dan jarak antar kedua benda? Yuk, kita mulai eksplorasi!
                                            """.withBoldText(text: "Tahukah kamu, bahwa gaya gravitasi dipengaruhi oleh massa benda dan jarak antar benda?", font: UIFont.systemFont(ofSize: 21)),
                                                    expImage_1: "DetailHukumNewton1",
                                                    expImage_2: "DetailHukumNewton2")
    
    static let misiDetail = ExperimentDetails(expDesc: """
                                        Gaya gravitasi adalah salah satu jenis gaya yang dipengaruhi oleh gaya tarik sebuah benda ke pusat benda tersebut.
                                        Oleh karena itu, sudah paham bukan bahwa gaya gravitasi berkaitan dengan massa antar benda dan juga jarak?
                                        
                                        Massa tiap benda memiliki satuan kilogram (kg) dan jarak antar benda yaitu kilometer (km). Disini, kamu akan menemukan adanya matahari dan bumi. Keduanya akan berpengaruh terhadap bagaimana kedua benda ini melintasi orbit.
                                        
                                        Agar semakin paham, disini kamu akan ditantang untuk menjalankan misi. Penasaran seperti apa misinya? Selamat mencoba!
                                        """.withBoldText(text: "Oleh karena itu, sudah paham bukan bahwa gaya gravitasi berkaitan dengan massa antar benda dan juga jarak?", font: UIFont.systemFont(ofSize: 21)),
                                              expImage_1: "DetailHukumNewton1",
                                              expImage_2: "DetailHukumNewton2")
    
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
            missionText: "Matahari dan Bumi terlalu jauh! Atur massa Matahari dan Bumi sehingga besar gaya tarik gravitasi antara kedua benda tersebut adalah sebesar 33.4 N agar mereka tidak terlepas dan keluar dari orbit",
            variables: [.firstMass, .secondMass],
            forceValue: 33.4,
            explainationText: "",
            explainationImage: ""
        ),
        HukumNewtonMission(
            missionText: "Matahari dan Bumi terlalu dekat! Atur jarak dan massa Matahari sehingga besar gaya tarik gravitasi antara kedua benda tersebut adalah sebesar 33.4 N agar mereka stabil dan tidak bertabrakan ataupun lepas dari orbit!",
            variables: [.distance, .firstMass],
            forceValue: 33.4,
            explainationText: "",
            explainationImage: ""
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
    
    static let explorationLabInstructions = ExperimentLab(
        labInstructions: [
            ContentLabel(
                text: "Apa itu mode Eksplorasi?",
                type: .bold,
                targetText: ["Apa itu mode Eksplorasi?"],
                fontsize: 17,
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10)
            ),
            ContentLabel(
                text: "Pada mode ini, kamu diberikan kebebasan untuk mengeksplorasi dan memvisualisasi konsep fisika dengan peraga di lab ini.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLabGravitasi1", "PetunjukLabGravitasi1"],
                padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 10),
                size: CGSize(width: 281, height: 62)
            ),
            ContentLabel(
                text: "Slider Massa Matahari dan Bumi digunakan untuk mengatur Massa kedua benda agar lebih besar atau lebih kecil.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLabGravitasi2", "PetunjukLabGravitasi2"],
                padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 10),
                size: CGSize(width: 281, height: 62)
            ),
            ContentLabel(
                text: "Slider jarak antar benda digunakan untuk mengatur jarak Matahari dan Bulan.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLab3", "PetunjukLab3"],
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 62, height: 62)
            ),
            ContentLabel(
                text: "Tombol Play digunakan untuk menjalankan peraga setelah mengatur variabel Massa atau Jarak.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLab4", "PetunjukLab4"],
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 62, height: 62)
            ),
            ContentLabel(
                text: "Tombol Undo digunakan untuk mengembalikan variabel dan peraga seperti semula.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLab5", "PetunjukLab5"],
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 92, height: 41)
            ),
            ContentLabel(
                text: "Tombol Konsep Teori digunakan untuk melihat teori terkait materi di dalam Lab.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
            )
        ]
    )
    
    static let MissionLabInstructions = ExperimentLab(
        labInstructions: [
            ContentLabel(
                text: "Apa itu mode Misi?",
                type: .bold,
                targetText: ["Apa itu mode Misi?"],
                fontsize: 17,
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10)
            ),
            ContentLabel(
                text: "Pada mode ini, kamu akan ditantang untuk menyelesaikan misi dengan cara mengubah beberapa variabel.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLabGravitasi1", "PetunjukLabGravitasi1"],
                padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 10),
                size: CGSize(width: 281, height: 62)
            ),
            ContentLabel(
                text: "Slider Massa Matahari dan Bumi digunakan untuk mengatur Massa kedua benda agar lebih besar atau lebih kecil.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLabGravitasi2", "PetunjukLabGravitasi2"],
                padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 10),
                size: CGSize(width: 281, height: 62)
            ),
            ContentLabel(
                text: "Slider jarak antar benda digunakan untuk mengatur jarak Matahari dan Bulan.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLab3", "PetunjukLab3"],
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 62, height: 62)
            ),
            ContentLabel(
                text: "Tombol Play digunakan untuk menjalankan peraga setelah mengatur variabel Massa atau Jarak.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLab4", "PetunjukLab4"],
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 62, height: 62)
            ),
            ContentLabel(
                text: "Tombol Undo digunakan untuk mengembalikan variabel dan peraga seperti semula.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["PetunjukLab5", "PetunjukLab5"],
                padding: UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 92, height: 41)
            ),
            ContentLabel(
                text: "Tombol Konsep Teori digunakan untuk melihat teori terkait materi di dalam Lab.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
            )
        ]
    )
    
    static let quiz = [
        ExperimentQuiz(
            quizImage: "QuizGravitasi1", quizQuestion: "Faktor-faktor di bawah ini yang mempengaruhi besar gravitasi pada Hukum Gravitasi Newton adalah?", quizOptionA: "A. Konstanta gravitasi", quizOptionB: "B. Ukuran benda", quizOptionC: "C. Bentuk benda", quizOptionD: "D. Semua salah", quizAnswer: "A. Konstanta gravitasi", quizExplanation: [
                ContentLabel(
                    text: "Rumus untuk menghitung besar gravitasi pada Hukum Gravitasi Newton adalah:",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 45, left: 10, bottom: 0, right: 10)
                ),
                ContentImage(
                    imageDetails: ["GravitasiNo1", "Rumus Gravitasi 1"],
                    padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 10),
                    size: CGSize(width: 300, height: 100)
                ),
                ContentLabel(
                    text: "Perhatikan bahwa yang mempengaruhi besar gravitasi hanyalah konstanta gravitasi G, massa benda pertama  m₁, massa benda kedua m², dan kuadrat jarak kedua benda r².",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
            ]
        ),
        ExperimentQuiz(
            quizImage: "QuizGravitasi2", quizQuestion: "Besar gravitasi berbanding _____ terhadap besar jarak kedua benda. Yang artinya semakin besar jarak kedua benda, maka besar gravitasi akan mengecil secara eksponensial", quizOptionA: "A. Eksponensial Lurus", quizOptionB: "B. Lurus", quizOptionC: "C. Terbalik", quizOptionD: "D. Eksponensial Terbalik", quizAnswer: "D. Eksponensial Terbalik", quizExplanation: [
                ContentLabel(
                    text: "Rumus untuk menghitung besar gravitasi pada Hukum Gravitasi Newton adalah:",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 45, left: 10, bottom: 0, right: 10)
                ),
                ContentImage(
                    imageDetails: ["GravitasiNo2_1", "Rumus Gravitasi 2 bagian 1"],
                    padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 10),
                    size: CGSize(width: 300, height: 100)
                ),
                ContentLabel(
                    text: "Apabila kita anggap G m₁m₂ bernilai konstan maka persamaannya menjadi:",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
                ContentImage(
                    imageDetails: ["GravitasiNo2_2","Rumus Gravitasi 2 bagian 2"],
                    padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 10),
                    size: CGSize(width: 300, height: 120)
                ),
                ContentLabel(
                    text: "Sehingga dapat disimpulkan bahwa gaya gravitasi berbanding eksponensial lurus terhadap jarak kedua benda atau berbanding lurus terhadap kuadrat jarak kedua benda.",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
            ]
        ),
        ExperimentQuiz(
            quizImage: "QuizGravitasi3", quizQuestion: "Pada Hukum Gravitasi Newton, semakin besar massa salah satu massa benda maka akan semakin besar pula _____", quizOptionA: "A. Konstanta gravitasi", quizOptionB: "B. Jarak kedua benda", quizOptionC: "C. Gaya gravitasi", quizOptionD: "D. Massa benda yang lainnya", quizAnswer: "C. Gaya gravitasi", quizExplanation: [
                ContentLabel(
                    text: "Konstanta gravitasi bersifat konstan yang berarti nilainya tidak akan berubah. Selain itu apabila diperhatikan kembali, berdasarkan rumus Hukum Gravitasi Newton:",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 45, left: 10, bottom: 0, right: 10)
                ),
                ContentImage(
                    imageDetails: ["GravitasiNo3", "Rumus Gravitasi 3"],
                    padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 10),
                    size: CGSize(width: 300, height: 120)
                ),
                ContentLabel(
                    text: "Mengindikasikan bahwa besar gaya gravitasi berbanding lurus dengan besar massa salah satu benda, dengan kata lain semakin besar massa salah satu benda maka akan semakin besar pula gaya gravitasinya.",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
            ]
        ),
        ExperimentQuiz(
            quizImage: "QuizGravitasi4", quizQuestion: "Apa yang menyebabkan gaya gravitasi antara dua benda bermassa sehari-hari (piring, payung, bola) nilainya relatif sangat kecil dibandingkan gaya pada umumnya?", quizOptionA: "A. Ukuran benda terlalu besar", quizOptionB: "B. Permukaan benda yang tidak rata", quizOptionC: "C. Angin yang kencang", quizOptionD: "D. Nilai konstanta gravitasi yang sangat kecil", quizAnswer: "D. Nilai konstanta gravitasi yang sangat kecil", quizExplanation: [
                ContentLabel(
                    text: "Nilai dari konstanta gravitasi adalah 6,67 x 10⁻¹¹ N∙m²/kg², sangat kecil sehingga menyebabkan gaya gravitasi yang terjadi antara piring-payung ataupun bola-payung relatif sangat kecil bahkan tidak terasa.",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 45, left: 10, bottom: 0, right: 10)
                ),
                ContentLabel(
                    text: "",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
                ContentLabel(
                    text: "",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
            ]
        ),
        ExperimentQuiz(
            quizImage: "QuizGravitasi5", quizQuestion: "Untuk memperbesar gaya gravitasi, kita perlu _____", quizOptionA: "A. Meningkatkan massa benda pertama", quizOptionB: "B. Meningkatkan massa benda kedua", quizOptionC: "C. Mengurangi jarak kedua benda", quizOptionD: "D. Semuanya benar", quizAnswer: "D. Semuanya benar", quizExplanation: [
                ContentLabel(
                    text: "Berdasarkan persamaan Hukum Gravitasi Newton:",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 45, left: 10, bottom: 0, right: 10)
                ),
                ContentImage(
                    imageDetails: ["GravitasiNo5", "Rumus Gravitasi 5"],
                    padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 10),
                    size: CGSize(width: 300, height: 100)
                ),
                ContentLabel(
                    text: "Untuk memperbesar gaya gravitasi kita perlu meningkatkan nilai massa benda pertama m₁, massa benda kedua m₂, dan jarak antar benda r.",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
            ]
        )
    ]
}
