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
    var firstValue: Float
    var secondValue: Float
    var thirdValue: Float
}
