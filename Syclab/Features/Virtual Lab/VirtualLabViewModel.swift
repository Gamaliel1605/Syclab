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
    lazy var defaultMissions = GerakParabolaMission(xRelatif: 0.5,
                                               yRelatif: 0.5,
                                               mission: "Atur sudut yang tepat agar bola masuk ke dalam ring. Kamu bisa menggunakan sudut yang bernilai dibawah ataupun diatas 45⁰!",
                                               enabledVariables: [.Sudut],
                                               sudut: 30,
                                               kecepatan: 20,
                                               explainationText: "Berdasarkan rumus diatas, xmaks (jarak tempuh maksimal benda) dipengaruhi nilai sudut elevasi melalui sin 2θ.  Oleh karena itu sebenarnya kamu dapat memasukan bola ke ring basket menggunakan dua sudut berbeda, sudut diatas ataupun dibawah 45⁰ ",
                                               explainationImgString: "Rumus5")

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
            } else {return defaultMissions}
        } else {return defaultMissions}
    }
    
    func currentMission() -> Any {
        if let missions = missions {
            if indexMission <= missions.count - 1 {
                return missions[indexMission]
            } else {return defaultMissions}
        } else {return defaultMissions}
    }
}
