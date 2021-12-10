//
//  HukumNewtonMission.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 18/11/21.
//

import UIKit

enum HukumNewtonVariables {
    case firstMass
    case secondMass
    case distance
}

enum HukumNewtonResult {
    case over
    case minus
}

class HukumNewtonMission {
    let missionText: String
    let variables: [HukumNewtonVariables]
    let forceValue: Double
    let explainationText: String
    let explainationImage: UIImage

    
    init(missionText: String, variables: [HukumNewtonVariables], forceValue: Double, explainationText: String, explainationImage: String) {
        self.missionText = missionText
        self.variables = variables
        self.forceValue = forceValue
        self.explainationText = explainationText
        if let img = UIImage(named: explainationImage) {
            self.explainationImage = img
        } else {
            self.explainationImage = UIImage()
        }
    }
}


//let explainationText: String
//let explainationImage: UIImage
//
//init(xRelatif: CGFloat, yRelatif: CGFloat, mission: String,
//     enabledVariables: [ParabolaVariables], sudut: Float,
//     kecepatan: Float, explainationText: String, explainationImgString: String ) {
//    self.xRelatif = xRelatif
//    self.yRelatif = yRelatif
//    self.missionText = mission
//    self.enabledVariables = enabledVariables
//    self.sudutValue = sudut
//    self.kecepatanValue = kecepatan
//    self.explainationText = explainationText
//    if let img = UIImage(named: explainationImgString) {
//        self.explainationImage = img
//    } else {
//        self.explainationImage = UIImage()
//    }
//}
