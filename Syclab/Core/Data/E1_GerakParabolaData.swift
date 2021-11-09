//
//  E1_GerakParabola.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 31/10/21.
//

import UIKit

struct E1_GerakParabolaData {
    static let experiment = Experiment(expTitle: "Gerak Parabola",
                                       expImage: "GerakParabola",
                                       id: .E1_GerakParabola)
    
    static let eksplorasiDetail = ExperimentDetails(expDesc: """
Gerak parabola adalah suatu gerak dari objek yang membentuk lintasan melengkung karena pengaruh gravitasi.

Pada mode ini, dapat secara bebas mengeksplor gerak parabola untuk memahami konsepnya.

Di sini, kamu akan bertemu Doni yang merupakan seorang pemain basket. Bantu Doni melemparkan bola basketnya dengan berbagai macam cara!

""".withBoldText(text: "suatu gerak dari objek yang membentuk lintasan melengkung karena pengaruh gravitasi.").string,
                                                    expImage_1: "Detail1",
                                                    expImage_2: "Detail2")
    
    static let misiDetail = ExperimentDetails(expDesc: """
                    Gerak parabola adalah suatu gerak dari objek yang membentuk lintasan melengkung karena pengaruh gravitasi.

                    Pada mode ini, kamu akan diberikan misi untuk diselesaikan.

                    Di sini, kamu akan bertemu Doni yang merupakan seorang pemain basket. Bantu Doni melemparkan bola basketnya dengan menyelesaikan misi-misi yang diberikan!
                    """,
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
    
    
    
    
    static let experimentConcept = ExperimentConcept(
        conceptTheory:
            [
                ContentLabel(
                    text: "Penjelasan Gerak Parabola",
                    alignment: .natural,
                    fontsize: 24,
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Sebuah objek yang ditembakkan/dilempar (proyektil) dengan sudut elevasi  dan kecepatan awal v0 akan bergerak dengan lintasan berbentuk parabola yang disebabkan oleh adanya percepatan gravitasi.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Gerak parabola sendiri sebenarnya adalah gabungan antara gerak lurus beraturan (GLB) yang dialami oleh proyektil (objek yang mengalami gerak parabola) terhadap sumbu X dan gerak lurus berubah beraturan (GLBB) yang dialami oleh proyektil terhadap sumbu Y. ",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["TeoriKonsep1", "Teori"],
                    padding: UIEdgeInsets(top: 25, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 558, height: 127)
                ),
                ContentLabel(
                    text: "Gerak parabola terhadap sumbu X",
                    alignment: .natural,
                    fontsize: 24,
                    padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Gerak parabola terhadap sumbu X merupakan gerak lurus beraturan (GLB) karena proyektil tidak dipengaruhi gaya apapun ketika sedang bergerak. Ingat bahwa di dunia nyata setiap proyektil mengalami gaya gesek dengan udara, tapi supaya kamu tidak bingung kita kan menghilangkan gaya gesek udaranya ya!",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["teori_sumbux", "Rumus Sumbu X"],
                    padding: UIEdgeInsets(top: 45, left: 30, bottom: 0, right: 30),
                    
                    size: CGSize(width: 368, height: 202)
                ),
                ContentImage(
                    imageDetails: ["TeoriKonsep2","Teori"],
                    padding: UIEdgeInsets(top: 34, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 589.53, height: 194)
                ),
                ContentLabel(
                    text: "Gerak parabola terhadap sumbu Y",
                    alignment: .natural,
                    fontsize: 24,
                    padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Gerak parabola terhadap sumbu Y merupakan gerak lurus berubah beraturan (GLBB) karena proyektil dipengaruhi gaya gravitasi yang memberikan percepatan konstan ke arah permukaan. Percepatan gravitasi inilah yang menyebabkan bentuk lintasan melengkung pada lintasan gerak parabola.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)),
                ContentImage(
                    imageDetails: ["teori_sumbuy","Rumus sumbu Y"],
                    padding: UIEdgeInsets(top: 34, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 369.3, height: 202)
                ),
                ContentImage(
                    imageDetails: ["TeoriKonsep3","Teori"],
                    padding: UIEdgeInsets(top: 34, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 589.53, height: 194)
                ),
                ContentLabel(
                    text: "Posisi proyektil terhadap sumbu-Y (y) atau ketinggian proyektil dirumuskan sebagai berikut:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["TeoriKonsep4","Teori"],
                    padding: UIEdgeInsets(top: 34, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 744, height: 202)),
                ContentLabel(
                    text: "Tinggi maksimum gerak parabola",
                    alignment: .natural,
                    fontsize: 24,
                    padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["tinggimaksimum", "Tinggi"],
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 353.27, height: 170)
                ),
                ContentLabel(
                    text: "Tinggi maksimum adalah posisi proyektil terhadap sumbu Y (y) pada titik tertinggi dari lintasan parabola. Salah satu syarat proyektil mencapai tinggi maksimum adalah kecepatan proyektil terhadap sumbu y harus sama dengan nol (vy=0), sehingga kita dapat menghitung waktu yang dibutuhkan oleh proyektil ketika mencapai ketinggian maksimum dengan:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus1", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 326, height: 177)
                ),
                ContentLabel(
                    text: "Bila persamaan waktu disubstitusikan ke persamaan jarak terhadap sumbu y, akan diperoleh:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus2", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 326, height: 139)
                ),
                ContentLabel(
                    text: "Sederhanakan perhitungan matematisnya, sehingga diperoleh persamaan tinggi maksimum (y maks):",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus3", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 267, height: 106)
                ),
                ContentLabel(
                    text: "Jarak maksimum gerak parabola",
                    alignment: .natural,
                    fontsize: 24,
                    padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["jarakmaksimum", "Jarak"],
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 353.27, height: 170)
                ),
                ContentLabel(
                    text: "Jarak maksimum adalah jarak yang ditempuh proyektil dari awal bergerak hingga berhenti bergerak. Pada saat proyektil mencapai jarak tempuh maksimum (xmaks) maka ketinggiannya akan minimum (y=0). Maka, persamaan jarak tempuh terhadap sumbu y menjadi:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus4", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 326, height: 177)
                ),
                ContentLabel(
                    text: "Bila persamaan waktu di atas disubstitusikan ke dalam persamaan jarak terhadap sumbu x:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus5", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 326, height: 139)
                ),
                ContentImage(
                    imageDetails: ["Rumus6", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 30, right: 30),
                    size: CGSize(width: 326, height: 139)
                ),
            ]
        )
    
    static let labInstructions = ExperimentLab (
        labInstructions: [
            ContentImage(
                imageDetails: ["GerakParabola_LabInstructions_1", "GerakParabola_LabInstructions_1"],
                padding: UIEdgeInsets(top: 30, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 245.81, height: 92)
            ),
            ContentLabel(
                text: "Kamu dapat mengubah besar sudut dan kecepatan lemparan bola basket",
                fontsize: 17,
                padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["GerakParabola_LabInstructions_2", "GerakParabola_LabInstructions_2"],
                padding: UIEdgeInsets(top: 30, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 90.72, height: 71)
            ),
            ContentLabel(
                text: "Semakin tinggi sudut, semakin  tinggi pula arah lemparan bola",
                fontsize: 17,
                padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
            ),
            ContentImage(
                imageDetails: ["GerakParabola_LabInstructions_3", "GerakParabola_LabInstructions_3"],
                padding: UIEdgeInsets(top: 30, left: 10, bottom: 0, right: 10),
                size: CGSize(width: 69.59, height: 40)
            ),
            ContentLabel(
                text: "Tekan tombol Jalankan untuk melempar bola.",
                fontsize: 17,
                padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
            )
        ]
    )
    
    static let missions = [GerakParabolaMission(xRelatif: 0.5,
                                                yRelatif: 0.5,
                                                mission: "Atur sudut yang tepat agar bola masuk ke dalam ring 1",
                                                enabledVariables: [.Sudut],
                                                sudut: 30,
                                                kecepatan: 20),
                           GerakParabolaMission(xRelatif: 0.76,
                                                yRelatif: 0.5,
                                                mission: "Atur sudut yang tepat agar bola masuk ke dalam ring 2",
                                                enabledVariables: [.Sudut],
                                                sudut: 30,
                                                kecepatan: 23),
                           GerakParabolaMission(xRelatif: 0.6,
                                                yRelatif: 0.5,
                                                mission: "Atur sudut yang tepat agar bola masuk ke dalam ring 3",
                                                enabledVariables: [.Kecepatan],
                                                sudut: 50,
                                                kecepatan: 15)]
    
    static let quiz = [
        ExperimentQuiz(
            quizImage: "Quiz1", quizQuestion: "Berapakah sudut yang dibutuhkan agar proyektil dapat menempuh jarak maksimum?", quizOptionA: "A. 30⁰", quizOptionB: "B. 45⁰", quizOptionC: "C. 60⁰", quizOptionD: "D. 90⁰", quizAnswer: "B. 45⁰", quizExplanation: """
            Rumus  untuk menghitung jarak maksimal dari proyektil adalah:
            
                                Xmax = v²₀/g sin 2θ
            
            Perhatikan bahwa nilai maksimal sin 2θ adalah 1, sehingga
            
                                sin 2 = 1
                                2 = 90⁰
                                θ = 45⁰
            """
        ),
        ExperimentQuiz(
            quizImage: "Quiz2", quizQuestion: "Berapakah sudut yang dibutuhkan agar proyektil dapat menempuh ketinggian maksimum?", quizOptionA: "A. 30⁰", quizOptionB: "B. 45⁰", quizOptionC: "C. 60⁰", quizOptionD: "D. 90⁰", quizAnswer: "D. 90⁰", quizExplanation: """
            Rumus untuk menghitung ketinggian yang dapat ditempuh oleh proyektil adalah:
            
                                y = v₀ sin θ t - 1/2 gt²
            
            Perhatikan bahwa nilai maksimal sin θ adalah 1, sehingga θ harus bernilai 90⁰.
            """
        ),
        ExperimentQuiz(
            quizImage: "Quiz3", quizQuestion: "Berikut adalah hal yang mempengaruhi gerak parabola, kecuali?", quizOptionA: "A. Percepatan gravitasi", quizOptionB: "B. Kecepatan awal proyektil", quizOptionC: "C. Sudut elevasi", quizOptionD: "D. Massa proyektil", quizAnswer: "D. Massa proyektil", quizExplanation: """
            Seberapa besar pun massa benda, selama kecepatan awal benda tersebut sama dengan kecepatan awal benda yang massanya jauh lebih kecil maka gerak parabola dari kedua benda tersebut akan sama (dengan asumsi tidak ada gaya gesek udara).
            """
        ),
        ExperimentQuiz(
            quizImage: "Quiz4", quizQuestion: "Pada gerak parabola, semakin besar kecepatan awal maka akan semakin besar pula…", quizOptionA: "A. Jarak tempuh proyektil", quizOptionB: "B. Massa proyektil", quizOptionC: "C. Bentuk proyektil", quizOptionD: "D. Sudut proyektil", quizAnswer: "A. Jarak tempuh proyektil", quizExplanation: """
            Berdasarkan dua persamaan di bawah ini:
            
                                y = v₀ sin θ t - 1/2 gt²
                                Xmax = v²₀/g sin 2θ
            
            Besar dari kecepatan awal proyektil berbanding lurus/eksponensial terhadap besar jarak tempuh dan ketinggian maksimum proyektil. Ketika nilai kecepatan awal meningkat maka nilai jarak tempuh dan ketinggian dari proyektil juga akan meningkat, begitu pula sebaliknya.
            """
        ),
        ExperimentQuiz(
            quizImage: "Quiz5", quizQuestion: "Faktor-faktor dibawah ini yang mempengaruhi gerak parabola adalah…", quizOptionA: "A. Percepatan gravitasi", quizOptionB: "B. Kecepatan awal", quizOptionC: "C. Sudut elevasi", quizOptionD: "D. Semua benar", quizAnswer: "D. Semua benar", quizExplanation: """
            Sederhananya, karena percepatan gravitasi, kecepatan awal, dan sudut elevasi terkandung dalam persamaan-persamaan gerak parabola yang kita pelajari, dapat dikatakan bahwa ketiganya mempengaruhi gerak parabola.
            """
        )
    ]
}
