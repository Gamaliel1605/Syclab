//
//  PhysicsCategory.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 04/11/21.
//

import Foundation

struct PhysicsCategory {
    static let none         : UInt32 = 0b1 << 0
    static let all          : UInt32 = UInt32.max
    static let tembok       : UInt32 = 0b1 << 1      // 1
    static let sensor       : UInt32 = 0b1 << 2//2
    static let projectile   : UInt32 = 0b1 << 3 //3
}
