//
//  MathFunctions.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 02/11/21.
//

import Foundation

class MathFunctions {
    static func quadraticTimeSolver(quadraticValue: Float, nonQuadraticValue: Float, constantValue: Float) -> Double {
        let a = Double(quadraticValue)
        let b = Double(nonQuadraticValue)
        let c = Double(constantValue)
        let bSquared = b * b
        let discriminant = bSquared - (4 * a * c)
        let isImaginary = discriminant < 0
        let discrimimantAbsSqrt = sqrt(fabs(discriminant))
        if isImaginary {
            fatalError("manya heueu nilainya imajiner")
        } else {
            let topFormula = -b + discrimimantAbsSqrt
            let bottomFormula = 2 * a
            let totalX = topFormula / bottomFormula
            //
            let topFormula2 = -b - discrimimantAbsSqrt
            let totalX2 = topFormula2 / bottomFormula
            if totalX >= 0 {
                return totalX
            } else {
                return totalX2
            }
        }
    }
}
