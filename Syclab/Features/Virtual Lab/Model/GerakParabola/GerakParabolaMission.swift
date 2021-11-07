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
    
    init(xRelatif: CGFloat, yRelatif: CGFloat, mission: String,
         enabledVariables: [ParabolaVariables], sudut: Float, kecepatan: Float) {
        self.xRelatif = xRelatif
        self.yRelatif = yRelatif
        self.missionText = mission
        self.enabledVariables = enabledVariables
        self.sudutValue = sudut
        self.kecepatanValue = kecepatan
    }
}


enum ParabolaVariables{
    case Sudut,
         Kecepatan
}
