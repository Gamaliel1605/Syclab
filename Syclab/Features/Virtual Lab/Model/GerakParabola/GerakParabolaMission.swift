//
//  GerakParabolaMission.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 05/11/21.
//

import UIKit

class GerakParabolaMission {
    let xRelatif: CGFloat
    let yRelatif: CGFloat
    let missionText : String
    let enabledVariables: [ParabolaVariables]
    let sudutValue: Float
    let kecepatanValue: Float
    let explainationText: String
    let explainationImage: UIImage
    
    init(xRelatif: CGFloat, yRelatif: CGFloat, mission: String,
         enabledVariables: [ParabolaVariables], sudut: Float,
         kecepatan: Float, explainationText: String, explainationImgString: String ) {
        self.xRelatif = xRelatif
        self.yRelatif = yRelatif
        self.missionText = mission
        self.enabledVariables = enabledVariables
        self.sudutValue = sudut
        self.kecepatanValue = kecepatan
        self.explainationText = explainationText
        if let img = UIImage(named: explainationImgString) {
            self.explainationImage = img
        } else {
            self.explainationImage = UIImage()
        }
    }
}


enum ParabolaVariables{
    case Sudut,
         Kecepatan
}
