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
    
    init(missionText: String, variables: [HukumNewtonVariables], forceValue: Double) {
        self.missionText = missionText
        self.variables = variables
        self.forceValue = forceValue
    }
}
