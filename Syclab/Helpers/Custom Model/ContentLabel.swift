//
//  swift
//  Pubery
//
//  Created by Antony Susanto on 03/08/21.
//

import UIKit

class ContentLabel : CustomConstraint {
	var text: String
	var type: LabelType
	var targetText: [String]
	var alignment: NSTextAlignment
	var fontSize: CGFloat
	
    init(text: String, type:LabelType = .regular, targetText:[String] = [], alignment:NSTextAlignment = .justified, fontsize:CGFloat = 18, padding: UIEdgeInsets, size: CGSize = .zero) {
		self.text = text
		self.type = type
		self.targetText = targetText
		self.alignment = alignment
		self.fontSize = fontsize
		super.init(padding: padding, size: size)
	}
	
	func create(elementsContainer:UIView, elementIndex:Int, elements:[UIView], lastElementIndex:Int) -> UILabel{
		let label = UILabel()

		if (type == .bold) {
			label.boldText(text: text, boldText: targetText)
		} else if (type == .highlight) {
			label.highlightText(text: text, coloredText: targetText, color: .red)
		} else if (type == .regular) {
			label.text = text
		}
		
		label.textAlignment = alignment
		label.font = label.font.withSize(fontSize)
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.sizeToFit()
		
		elementsContainer.addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		if (elementIndex == 0 && lastElementIndex == 0) {
            label.setConstraint(top: elementsContainer.topAnchor, leading: elementsContainer.leadingAnchor, bottom: elementsContainer.bottomAnchor, trailing: elementsContainer.trailingAnchor, padding: padding, size: size)
		} else if (elementIndex == 0) {
			label.setConstraint(top: elementsContainer.topAnchor, leading: elementsContainer.leadingAnchor, bottom: nil, trailing: elementsContainer.trailingAnchor, padding: padding, size: size)
		} else if (elementIndex != 0 && elementIndex != lastElementIndex ){
			let previousElement = elements[elementIndex-1]
            label.setConstraint(top: previousElement.bottomAnchor, leading: elementsContainer.leadingAnchor, bottom: nil, trailing: elementsContainer.trailingAnchor, padding: padding, size: size)
        } else {
            let previousElement = elements[elementIndex-1]
            label.setConstraint(top: previousElement.bottomAnchor, leading: elementsContainer.leadingAnchor, bottom: elementsContainer.bottomAnchor, trailing: elementsContainer.trailingAnchor, padding: padding, size: size)
        }
		
		return label
	}
}
