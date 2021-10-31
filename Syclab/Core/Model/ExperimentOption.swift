//
//  ExperimentOption.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 29/10/21.
//

import UIKit

class ExperimentOption {
    
    var expPlaygroundTitle: String
    var expPlaygroundImage: String
    var expPlaygroundDesc: String
    var expMissionTitle: String
    var expMissionImage: String
    var expMissionDesc: String
    var expQuizTitle: String
    var expQuizImage: String
    var expQuizDesc: String
    
    init(expPlaygroundTitle: String, expPlaygroundImage:String, expPlaygroundDesc:String, expMissionTitle: String, expMissionImage: String, expMissionDesc: String, expQuizTitle: String, expQuizImage: String, expQuizDesc: String) {
        self.expPlaygroundTitle = expPlaygroundTitle
        self.expPlaygroundImage = expPlaygroundImage
        self.expPlaygroundDesc = expPlaygroundDesc
        self.expMissionTitle = expMissionTitle
        self.expMissionImage = expMissionImage
        self.expMissionDesc = expMissionDesc
        self.expQuizTitle = expQuizTitle
        self.expQuizImage = expQuizImage
        self.expQuizDesc = expQuizDesc
    }
}
