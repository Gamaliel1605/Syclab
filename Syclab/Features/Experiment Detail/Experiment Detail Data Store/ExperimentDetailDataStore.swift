//
//  ExperimentDetailDataStore.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 26/10/21.
//

import UIKit

class ExperimentDetailDataStore {
    static func gerakParabola() -> ExperimentDetail {
        let title = "Penjelasan Eksperimen"
        let description = """
Gerak parabola atau gerak peluru adalah suatu gerak dari objek yang membentuk lintasan melengkung karena hanya pengaruh gravitasi.

Mungkin kamu asing dengan namanya, tapi ternyata gerak parabola ada disekitar kamu loh, diantaranya:
- Gerak bola ketika ditendang pemain bola favoritmu
- Gerak bola basket yang ditembakan pemain basket favoritmu
- Atau sesederhana gerak sampah yang kamu lempar ke tong sampah

Nah, dengan memahami gerak parabola kamu akan semakin mahir bermain bola, basket, dan buang sampah loh! Jadi tunggu apalagi, ayo pahami gerak parabola dengan Scylab!
"""
        let descriptionAttributed = description.withBoldText(text: "suatu gerak dari objek yang membentuk lintasan melengkung karena hanya pengaruh gravitasi", font: UIFont.systemFont(ofSize: 21, weight: .regular))
       
        let firstImage = UIImage(named: "GerakParabola_description_1") ?? UIImage()
        let secondImage = UIImage(named: "GerakParabola_description_2") ?? UIImage()
        return ExperimentDetail(title: title, description: descriptionAttributed, firstImage: firstImage, secondImage: secondImage)
    }
}
