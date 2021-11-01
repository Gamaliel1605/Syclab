//
//  HomeViewModel.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import Foundation
import UIKit

class HomeViewModel {
    let expDatas = Experiments.getExpData()
    let homeData: [HomeData] = [
        HomeData(expName: "Gerak Parabola", expImage: "placeholder"),
        HomeData(expName: "Hukum Newton", expImage: "placeholder")
    ]
    
}
