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
                                                    expImage_1: "GerakParabola_description_1",
                                                    expImage_2: "GerakParabola_description_2")
    
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
                    fontsize: 22,
                    padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Sebuah objek yang ditembakkan/dilempar (proyektil) dengan sudut elevasi  dan kecepatan awal v0 akan bergerak dengan lintasan berbentuk parabola yang disebabkan oleh adanya percepatan gravitasi g.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["GerakParabola_TeoriKonsep_ilustrasi", "Ilustrasi Gerak Parabola"],
                    padding: UIEdgeInsets(top: 45, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 355, height: 153)
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
                    padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["GerakParabola_TeoriKonsep_Rumus_1", "Rumus Gerak Parabola 1"],
                    padding: UIEdgeInsets(top: 45, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 340.62, height: 79.65)
                ),
                ContentLabel(
                    text: """
                    vx\t= kecepatan proyektil terhadap sumbu X (m/s)
                    v0\t= kecepatan awal proyektil (m/s)
                    \t= sudut elevasi (⁰)
                    """,
                    alignment: .natural,
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 5, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Rumus menyatakan bahwa besar vx akan selalu berbanding lurus dengan besar v0 dan cos, artinya semakin besar nilai v0 dan cos maka akan semakin besar pula nilai dari vx",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 40, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Posisi proyektil terhadap sumbu-X (x) dirumuskan sebagai berikut:",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30)
                ),
                ContentImage(
                    imageDetails: ["GerakParabola_TeoriKonsep_Rumus_2", "Rumus Gerak Parabola 2"],
                    padding: UIEdgeInsets(top: 5, left: 30, bottom: 0, right: 30),
                    size: CGSize(width: 340.62, height: 79.65)
                ),
                ContentLabel(
                    text: """
                    Dengan:
                    x\t= posisi proyektil terhadap sumbu X (m/s)
                    v0\t= kecepatan awal proyektil (m/s)
                    vx\t= kecepatan proyektil terhadap sumbu x (m/s)
                    \t= sudut elevasi (⁰)
                    t\t= waktu tempuh proyektil (s)
                    """,
                    alignment: .natural,
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 5, left: 30, bottom: 0, right: 30)
                ),
                ContentLabel(
                    text: "Rumus ini menyatakan bahwa besar nilai x akan selalu berbanding lurus dengan besar v0, cos, dan t. Semakin besar nilai v0, cos, dan t maka akan semakin besar pula nilai x.",
                    fontsize: 17,
                    padding: UIEdgeInsets(top: 5, left: 30, bottom: 20, right: 30)
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
}
