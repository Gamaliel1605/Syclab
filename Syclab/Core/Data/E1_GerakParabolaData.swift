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
    Tahukah kamu, bahwa gerak parabola dipengaruhi oleh kecepatan dan sudut?

    Pada mode kali ini, kamu dapat secara bebas mengubah kecepatan dan sudut mengeksplor gerak parabola agar dapat memahami konsepnya.

    Di sini, kamu akan bertemu Doni yang merupakan seorang pemain basket. Penasaran dengan lintasan melengkung pada parabola seperti apa? yuk, tekan mulai untuk mencoba eksplorasi!
    """.withBoldText(text: "Tahukah kamu, bahwa gerak parabola dipengaruhi oleh kecepatan dan sudut?"),
                                                    expImage_1: "DetailGerakParabola1",
                                                    expImage_2: "DetailGerakParabola2")
    
    static let misiDetail = ExperimentDetails(expDesc: """
                    Gerak parabola adalah suatu gerak dari objek yang membentuk lintasan melengkung karena pengaruh gravitasi.
                    Tahukah kamu bahwa gerak parabola dipengaruhi oleh kecepatan dan sudut?

                    Kecepatan diperoleh dari velocity (v) dan sudut diwakilkan oleh teta (θ). Keduanya akan berpengaruh sesuai dengan lemparan kamu nih kawan syclab.

                    Agar semakin paham, disini kamu akan ditantang untuk mengubah sesuai dengan perintah yang ada. Selamat mencoba!
                    """.withBoldText(text: "Tahukah kamu bahwa gerak parabola dipengaruhi oleh kecepatan dan sudut?"),
                                                    expImage_1: "DetailGerakParabola1",
                                                    expImage_2: "DetailGerakParabola2")
    
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
                    fontsize: 25,
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
                    padding: UIEdgeInsets(top: 25, left: 120, bottom: 0, right: 30),
                    size: CGSize(width: 558, height: 127)
                ),
                ContentLabel(
                    text: "Gerak parabola terhadap sumbu X",
                    alignment: .natural,
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Gerak parabola terhadap sumbu X merupakan gerak lurus beraturan (GLB) karena proyektil tidak dipengaruhi gaya apapun ketika sedang bergerak. Ingat bahwa di dunia nyata setiap proyektil mengalami gaya gesek dengan udara, tapi supaya kamu tidak bingung kita kan menghilangkan gaya gesek udaranya ya!",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["teori_sumbux", "Rumus Sumbu X"],
                    padding: UIEdgeInsets(top: 45, left: 210, bottom: 0, right: 30),
                    
                    size: CGSize(width: 368, height: 202)
                ),
                ContentImage(
                    imageDetails: ["TeoriKonsep2","Teori"],
                    padding: UIEdgeInsets(top: 34, left: 105, bottom: 0, right: 30),
                    size: CGSize(width: 589.53, height: 194)
                ),
                ContentLabel(
                    text: "Gerak parabola terhadap sumbu Y",
                    alignment: .natural,
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Gerak parabola terhadap sumbu Y merupakan gerak lurus berubah beraturan (GLBB) karena proyektil dipengaruhi gaya gravitasi yang memberikan percepatan konstan ke arah permukaan. Percepatan gravitasi inilah yang menyebabkan bentuk lintasan melengkung pada lintasan gerak parabola.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)),
                ContentImage(
                    imageDetails: ["teori_sumbuy","Rumus sumbu Y"],
                    padding: UIEdgeInsets(top: 34, left: 210, bottom: 0, right: 30),
                    size: CGSize(width: 369.3, height: 202)
                ),
                ContentImage(
                    imageDetails: ["TeoriKonsep3","Teori"],
                    padding: UIEdgeInsets(top: 34, left: 105, bottom: 0, right: 30),
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
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["tinggimaksimum", "Tinggi"],
                    padding: UIEdgeInsets(top: 20, left: 220, bottom: 0, right: 30),
                    size: CGSize(width: 353.27, height: 170)
                ),
                ContentLabel(
                    text: "Tinggi maksimum adalah posisi proyektil terhadap sumbu Y (y) pada titik tertinggi dari lintasan parabola. Salah satu syarat proyektil mencapai tinggi maksimum adalah kecepatan proyektil terhadap sumbu y harus sama dengan nol (vy=0), sehingga kita dapat menghitung waktu yang dibutuhkan oleh proyektil ketika mencapai ketinggian maksimum dengan:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus1", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 235, bottom: 0, right: 30),
                    size: CGSize(width: 326, height: 177)
                ),
                ContentLabel(
                    text: "Bila persamaan waktu disubstitusikan ke persamaan jarak terhadap sumbu y, akan diperoleh:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus2", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 235, bottom: 0, right: 30),
                    size: CGSize(width: 326, height: 139)
                ),
                ContentLabel(
                    text: "Sederhanakan perhitungan matematisnya, sehingga diperoleh persamaan tinggi maksimum (y maks):",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus3", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 260, bottom: 0, right: 30),
                    size: CGSize(width: 267, height: 106)
                ),
                ContentLabel(
                    text: "Jarak maksimum gerak parabola",
                    alignment: .natural,
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["jarakmaksimum", "Jarak"],
                    padding: UIEdgeInsets(top: 20, left: 220, bottom: 0, right: 30),
                    size: CGSize(width: 353.27, height: 170)
                ),
                ContentLabel(
                    text: "Jarak maksimum adalah jarak yang ditempuh proyektil dari awal bergerak hingga berhenti bergerak. Pada saat proyektil mencapai jarak tempuh maksimum (xmaks) maka ketinggiannya akan minimum (y=0). Maka, persamaan jarak tempuh terhadap sumbu y menjadi:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus4", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 235, bottom: 0, right: 30),
                    size: CGSize(width: 326, height: 177)
                ),
                ContentLabel(
                    text: "Bila persamaan waktu di atas disubstitusikan ke dalam persamaan jarak terhadap sumbu x:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["Rumus5", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 235, bottom: 0, right: 30),
                    size: CGSize(width: 326, height: 139)
                ),
                ContentImage(
                    imageDetails: ["Rumus6", "Rumus"],
                    padding: UIEdgeInsets(top: 20, left: 235, bottom: 30, right: 30),
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
                                                mission: "Atur sudut yang tepat agar bola masuk ke dalam ring. Kamu bisa menggunakan sudut yang bernilai dibawah ataupun diatas 45⁰!",
                                                enabledVariables: [.Sudut],
                                                sudut: 30,
                                                kecepatan: 20,
                                                explainationText: "Berdasarkan rumus diatas, xmaks (jarak tempuh maksimal benda) dipengaruhi nilai sudut elevasi melalui sin 2θ.  Oleh karena itu sebenarnya kamu dapat memasukan bola ke ring basket menggunakan dua sudut berbeda, sudut diatas ataupun dibawah 45⁰ ",
                                                explainationImgString: "Rumus5"),
                           
                           GerakParabolaMission(xRelatif: 0.76,
                                                yRelatif: 0.5,
                                                mission: "Atur sudut yang tepat agar bola masuk ke dalam ring. Kamu bisa menggunakan sudut yang bernilai dibawah ataupun diatas 45⁰!",
                                                enabledVariables: [.Sudut],
                                                sudut: 30,
                                                kecepatan: 23,
                                                explainationText: "Perhatikan bahwa dengan mengubah sudut, kamu dapat meningkatkan dan menurunkan nilai dari xmax (jarak tempuh maksimal benda) sesuai dengan rumus diatas. Perhatikan bahwa sin 2θ memiliki nilai maksimum 1 yang hanya dapat diraih dengan sudut sebesar 45⁰!",
                                                explainationImgString: "Rumus5"),
                           
                           GerakParabolaMission(xRelatif: 0.6,
                                                yRelatif: 0.5,
                                                mission: "Atur kecepatan yang tepat agar bola masuk ke dalam ring. Perhatikan apa yang terjadi ketika kamu mengganti kecepatannya!",
                                                enabledVariables: [.Kecepatan],
                                                sudut: 50,
                                                kecepatan: 15,
                                                explainationText: "Berdasarkan apa yang telah kamu lakukan dan rumus diatas, kita dapat menyimpulkan bahwa besar nilai xmaks (jarak tempuh maksimal benda) berbanding lurus dengan besar maksimal. Semakin besar nilai kecepatan bola, maka akan semakin besar pula nilai xmaks/jarak tempuh bola.",
                                                explainationImgString: "Rumus5")]
    
    static let quiz = [
        ExperimentQuiz(
            quizImage: "Quiz1", quizQuestion: "Berapakah sudut yang dibutuhkan agar proyektil dapat menempuh jarak maksimum?", quizOptionA: "A. 30⁰", quizOptionB: "B. 45⁰", quizOptionC: "C. 60⁰", quizOptionD: "D. 90⁰", quizAnswer: "B. 45⁰",
            quizExplanation: [
                    ContentLabel(
                        text: "Rumus  untuk menghitung jarak maksimal dari proyektil adalah:",
                        fontsize: 25,
                        padding: UIEdgeInsets(top: 45, left: 10, bottom: 0, right: 10)
                    ),
                    ContentImage(
                        imageDetails: ["ParabolaNo1_1", "Rumus Parabola 1 bagian 1"],
                        padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 10),
                        size: CGSize(width: 300, height: 100)
                    ),
                    ContentLabel(
                        text: "Perhatikan bahwa nilai maksimal sin 2θ adalah 1, sehingga",
                        fontsize: 25,
                        padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                    ),
                    ContentImage(
                        imageDetails: ["ParabolaNo1_2", "Rumus Parabola 1 bagian 2"],
                        padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 10),
                        size: CGSize(width: 300, height: 160)
                    )
                ]
        ),
        ExperimentQuiz(
            quizImage: "Quiz2", quizQuestion: "Berapakah sudut yang dibutuhkan agar proyektil dapat menempuh ketinggian maksimum?", quizOptionA: "A. 30⁰", quizOptionB: "B. 45⁰", quizOptionC: "C. 60⁰", quizOptionD: "D. 90⁰", quizAnswer: "D. 90⁰", quizExplanation: [
                ContentLabel(
                    text: "Rumus untuk menghitung ketinggian yang dapat ditempuh oleh proyektil adalah:",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 45, left: 10, bottom: 0, right: 10)
                ),
                ContentImage(
                    imageDetails: ["ParabolaNo2", "Rumus Parabola 2"],
                    padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 10),
                    size: CGSize(width: 350, height: 100)
                ),
                ContentLabel(
                    text: "Perhatikan bahwa nilai maksimal sin θ adalah 1, sehingga θ harus bernilai 90⁰.",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
            ]
        ),
        ExperimentQuiz(
            quizImage: "Quiz3", quizQuestion: "Berikut adalah hal yang mempengaruhi gerak parabola, kecuali?", quizOptionA: "A. Percepatan gravitasi", quizOptionB: "B. Kecepatan awal proyektil", quizOptionC: "C. Sudut elevasi", quizOptionD: "D. Massa proyektil", quizAnswer: "D. Massa proyektil", quizExplanation: [
                ContentLabel(
                    text: "Seberapa besar pun massa benda, selama kecepatan awal benda tersebut sama dengan kecepatan awal benda yang massanya jauh lebih kecil maka gerak parabola dari kedua benda tersebut akan sama (dengan asumsi tidak ada gaya gesek udara).",
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
            quizImage: "Quiz4", quizQuestion: "Pada gerak parabola, semakin besar kecepatan awal maka akan semakin besar pula…", quizOptionA: "A. Jarak tempuh proyektil", quizOptionB: "B. Massa proyektil", quizOptionC: "C. Bentuk proyektil", quizOptionD: "D. Sudut proyektil", quizAnswer: "A. Jarak tempuh proyektil", quizExplanation: [
                ContentLabel(
                    text: "Berdasarkan dua persamaan di bawah ini:",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 45, left: 10, bottom: 0, right: 10)
                ),
                ContentImage(
                    imageDetails: ["ParabolaNo4", "Rumus Parabola 4"],
                    padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 10),
                    size: CGSize(width: 300, height: 120)
                ),
                ContentLabel(
                    text: "Besar dari kecepatan awal proyektil berbanding lurus/eksponensial terhadap besar jarak tempuh dan ketinggian maksimum proyektil. Ketika nilai kecepatan awal meningkat maka nilai jarak tempuh dan ketinggian dari proyektil juga akan meningkat, begitu pula sebaliknya.",
                    fontsize: 25,
                    padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                ),
            ]
        ),
        ExperimentQuiz(
            quizImage: "Quiz5", quizQuestion: "Faktor-faktor dibawah ini yang mempengaruhi gerak parabola adalah…", quizOptionA: "A. Percepatan gravitasi", quizOptionB: "B. Kecepatan awal", quizOptionC: "C. Sudut elevasi", quizOptionD: "D. Semua benar", quizAnswer: "D. Semua benar", quizExplanation: [
                ContentLabel(
                    text: "Sederhananya, karena percepatan gravitasi, kecepatan awal, dan sudut elevasi terkandung dalam persamaan-persamaan gerak parabola yang kita pelajari, dapat dikatakan bahwa ketiganya mempengaruhi gerak parabola.",
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
        )
    ]
}
