//
//  ExperimentOptionA.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 31/10/21.
//

import Foundation

class ExperimentOption {
    
    var optionTitle: modeOption
    var optionDesc: String
    var optionImgStr: String
    
    init(title: modeOption, desc: String, imgName: String) {
        self.optionTitle = title
        self.optionDesc = desc
        self.optionImgStr = imgName
    }
}
