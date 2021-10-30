//
//  LabelExtension.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 30/10/21.
//

import Foundation
import UIKit

extension UILabel {
    func highlightText(text: String, coloredText: [String], color: UIColor) {
        let attributedString = NSMutableAttributedString(string: text)
        coloredText.forEach { coloredText in
            let range = (text as NSString).range(of: coloredText)
            attributedString.setAttributes([.foregroundColor: color], range: range)
        }
        self.attributedText = attributedString
    }

    func boldText(text: String, boldText: [String]) {
        let attributedString = NSMutableAttributedString(string: text)
        boldText.forEach { boldText in
            let range = (text as NSString).range(of: boldText)
            attributedString.setAttributes([.font: UIFont.systemFont(ofSize: 17, weight: .bold)], range: range)
        }
        self.attributedText = attributedString
    }
}

