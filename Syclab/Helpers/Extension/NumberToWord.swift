//
//  NumberToWord.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 19/11/21.
//

import UIKit

extension Int {
    func convertToWord() -> String {
        switch(self) {
        case 1:
            return "PERTAMA"
        case 2:
            return "KEDUA"
        case 3:
            return "KETIGA"
        case 4:
            return "KEEMPAT"
        default:
            return "Not Defined"
        }
    }
}
