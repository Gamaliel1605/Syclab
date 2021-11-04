//
//  AttributedString.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 26/10/21.
//

import UIKit

extension String {
    func withBoldText(text: String, font: UIFont? = nil) -> NSAttributedString {
        let fontStyle = font ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let firstAttributes: [NSAttributedString.Key: Any] = [
           .font: fontStyle,
           .paragraphStyle: paragraphStyle
        ]
        let attributedString = NSMutableAttributedString(string: self, attributes: firstAttributes)
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: fontStyle.pointSize)
        ]
        let secondAttributesRange = (self as NSString).range(of: text)
        attributedString.addAttributes(secondAttributes, range: secondAttributesRange)
        
        return attributedString
    }
}
