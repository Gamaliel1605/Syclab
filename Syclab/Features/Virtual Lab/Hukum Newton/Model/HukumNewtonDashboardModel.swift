//
//  HukumNewtonDashboardModel.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 14/11/21.
//

import UIKit

protocol DashboardModel {
    var firstValue: Float { get set }
    var secondValue: Float { get set }
    var thirdValue: Float { get set }
}

struct HukumNewtonDashboardModel: DashboardModel {
    let gravity: Float = 6.67 * pow(10, -11)
    
    var firstValue: Float
    var secondValue: Float
    var thirdValue: Float
    
    var firstMass: Float {
        firstValue * 1000000
    }
    var secondMass: Float {
        secondValue * 1000000
    }
    var distancePowerbyTwo: Float {
        pow(thirdValue, 2)
    }
    
    var calculatedForceResult: Float {
        return (gravity * firstMass * secondMass) / distancePowerbyTwo
    }
}
