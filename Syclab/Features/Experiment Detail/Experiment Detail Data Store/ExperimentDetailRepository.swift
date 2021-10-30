//
//  ExperimentDetailRepository.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 26/10/21.
//

import UIKit

class ExperimentDetailRepository {
    var gerakParabola: ExperimentDetail
    
    static let shared = ExperimentDetailRepository(gerakParabola: ExperimentDetailDataStore.gerakParabola())
    
    init(gerakParabola: ExperimentDetail) {
        self.gerakParabola = gerakParabola
    }
}
