//
//  HukumNewtonDashboardModel.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 14/11/21.
//

import UIKit

class HukumNewtonDashboardModel {
    let gravity: Double = 6.67 * pow(10, -11)
    let defaultValue: (first: Double, second: Double, third: Double) = (1, 1, 10)
    var currentValue: (first: Double, second: Double, third: Double) = (1, 1, 10)
    
    var firstMass: Double {
        currentValue.first * 1000000
    }
    var secondMass: Double {
        currentValue.second * 1000000
    }
    var distancePowerbyTwo: Double {
        pow(currentValue.third, 2)
    }
    
    var calculatedForceResult: Double {
        return (gravity * firstMass * secondMass) / distancePowerbyTwo
    }
    
    static let shared = HukumNewtonDashboardModel()
    
    func reset() {
        currentValue = defaultValue
    }
}
