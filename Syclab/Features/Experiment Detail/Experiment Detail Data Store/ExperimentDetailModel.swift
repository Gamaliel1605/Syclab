//
//  ExperimentDetailModel.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 26/10/21.
//

import UIKit

protocol ExperimentDetailStructure {
    var title: String { get set }
    var description: NSAttributedString { get set }
    var firstImage: UIImage { get set }
    var secondImage: UIImage { get set }
}

class ExperimentDetail: ExperimentDetailStructure {
    var title: String
    var description: NSAttributedString
    var firstImage: UIImage
    var secondImage: UIImage
    
    init(title: String, description: NSAttributedString, firstImage: UIImage, secondImage: UIImage) {
        self.title = title
        self.description = description
        self.firstImage = firstImage
        self.secondImage = secondImage
    }
}
