//
//  VirtualLabViewModel.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import Foundation
import UIKit

class VirtualLabViewModel: NSObject {
    let missions: [Any]?

    let isMission: Bool
    let check: modeOption
    let experiment: Experiments
    let title: String
    
    var indexMission = 0
    
    init(check: modeOption, experiment: Experiments) {
        self.check = check
        self.experiment = experiment
        self.title = experiment.getExpTitle()
        
        if check == .Misi{
            self.missions = experiment.getMissions()
            self.isMission = true
        } else {
            self.missions = []
            self.isMission = false
        }
    }
    
    func nextMission() -> Any {
        if let missions = missions {
            if indexMission <= missions.count - 1 {
                indexMission += 1
                return missions[indexMission]
            } else {return []}
        } else {return []}
    }
    
    func currentMission() -> Any {
        if let missions = missions {
            if indexMission <= missions.count - 1 {
                return missions[indexMission]
            } else {return []}
        } else {return []}
    }
}
