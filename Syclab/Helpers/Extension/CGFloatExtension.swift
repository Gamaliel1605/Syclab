//
//  CGFloatExtension.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 14/11/21.
//

import UIKit

extension CGPoint {
    func distanceFromCGPoint(point:CGPoint)->CGFloat{
        return sqrt(pow(self.x - point.x,2) + pow(self.y - point.y,2))
    }
}
