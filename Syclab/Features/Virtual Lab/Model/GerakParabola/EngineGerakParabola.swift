//
//  EngineGerakParabola.swift
//  Syclab
//
//  Created by Jehnsen Hirena Kane on 02/11/21.
//

import Foundation
import UIKit
import SpriteKit

class EngineGerakParabola {
    //for freestyle mode
    var kecAwal : Float = 100
    var sudutAwal : Double = 45
    var waktu : Double = 1
    var gravitasiReal : Float = 9.8
    var poinKeMeter : Float = 50
    
    //callable function
    func kecepatanXAwalEngine(sudutTembak: Double, kecepatanAwal: Float) -> CGFloat {
        return CGFloat(kecepatanAwal * poinKeMeter * Float(__cospi(sudutTembak/180)))
    }
    func kecepatanXAwalReal(sudutTembak: Double, kecepatanAwal: Float) -> CGFloat {
        return CGFloat(kecepatanAwal * Float(__cospi(sudutTembak/180)))
    }
    func kecepatanYAwalEngine(sudutTembak: Double, kecepatanAwal: Float) -> CGFloat {
        return CGFloat(kecepatanAwal * poinKeMeter * Float(__sinpi(sudutTembak/180)))
    }
    func kecepatanYAwalReal(sudutTembak: Double, kecepatanAwal: Float) -> CGFloat {
        return CGFloat(kecepatanAwal * Float(__sinpi(sudutTembak/180)))
    }
    func kecepatanX(sudutTembak: Double, kecepatanAwal: Float) -> CGFloat {
        return CGFloat(kecepatanAwal * Float(__cospi(sudutTembak/180)))
    }
    func sudutDariKecepatanAwalY(kecepatanAwal: Float, kecepatanAwalY: Float) -> Float {
        return asin(kecepatanAwalY/kecepatanAwal)*180/Float.pi
    }
    func sudutDariKecepatanAwalX(kecepatanAwal: Float, kecepatanAwalX: Float) -> Float {
        return acos(kecepatanAwalX/kecepatanAwal)*180/Float.pi
    }
    func titikTertinggiDariKecepatanAwalReal(kecepatanAwal: Float, sudutTembak: Double, gravitasi: Float) -> Float {
        return (pow(kecepatanAwal, 2) * pow(Float(__sinpi(sudutTembak/180)), 2))/(2 * -gravitasi)
    }
    func titikTertinggiDariKecepatanAwalYReal(kecepatanAwalY: Float, gravitasi: Float) -> Float {
        return (pow(kecepatanAwalY, 2))/(2 * -gravitasi)
    }
    func titikTertinggiDariKecepatanAwalY(kecepatanAwalY: Float, gravitasi: Float) -> Float {
        return (pow(kecepatanAwalY, 2))/(2*gravitasi)
    }
    func jarakTerjauhDariKecepatanAwalReal(kecepatanAwal: Float, sudutTembak: Double, gravitasi: Float) -> Float {
        return (pow(kecepatanAwal, 2) / -gravitasi) * Float(__sinpi((2*sudutTembak)/180))
    }
    func waktuUntukTitikTertinggiReal(kecepatanAwal: Float, sudutTembak: Double, gravitasi: Float) -> Float {
        return kecepatanAwal * Float(__sinpi(sudutTembak/180)) / -gravitasi
    }
    func waktuUntukJarakTerjauhEngine(kecepatanAwal: Float, sudutTembak: Double, gravitasi: Float, ketinggian: Float)
    -> Float {
        if ketinggian == 0 {
            return 2 * poinKeMeter * kecepatanAwal * Float(__sinpi(sudutTembak/180)) / (-gravitasi * 150)
        } else {
            // Referensi
            // https://ftp.unpad.ac.id/bse/Kurikulum_2006/11_SMA/Praktis_belajar_fisika_SMA_XI_IPA_Aip_S_dkk.pdf
            let komponenNonQuadratic = kecepatanYAwalEngine(sudutTembak: sudutTembak, kecepatanAwal: kecepatanAwal)
            let komponenQuadratic = 0.5 * gravitasi * 150 // Emg pengen nilainya minus
            return Float(MathFunctions.quadraticTimeSolver(quadraticValue: komponenQuadratic,
                                             nonQuadraticValue: Float(komponenNonQuadratic), constantValue: ketinggian))
        }
    }
    func waktuUntukJarakTerjauhReal(kecepatanAwal: Float, sudutTembak: Double, gravitasi: Float, ketinggian: Float)
    -> Float {
        if ketinggian == 0 {
            return 2 * kecepatanAwal * Float(__sinpi(sudutTembak/180)) / (-gravitasi)
        } else {
            // Referensi
            // https://ftp.unpad.ac.id/bse/Kurikulum_2006/11_SMA/Praktis_belajar_fisika_SMA_XI_IPA_Aip_S_dkk.pdf
            let komponenNonQuadratic = kecepatanYAwalReal(sudutTembak: sudutTembak, kecepatanAwal: kecepatanAwal)
            let komponenQuadratic = 0.5 * gravitasi // Emg pengen nilainya minus
            return Float(MathFunctions.quadraticTimeSolver(quadraticValue: komponenQuadratic,
                                             nonQuadraticValue: Float(komponenNonQuadratic), constantValue: ketinggian))
        }
    }

    /// MARK: - Fungsi Terhadap Waktu
    func xProyektilTerhadapWaktuEngine(kecepatanAwal: Float, sudutTembak: Double, waktu: Float) -> CGFloat {
        return CGFloat(Double(kecepatanAwal * poinKeMeter) * __cospi(sudutTembak/180) * Double(waktu) )
    }
    func xProyektilTerhadapWaktuReal(kecepatanAwal: Float, sudutTembak: Double, waktu: Float) -> CGFloat {
        return CGFloat(Double(kecepatanAwal) * __cospi(sudutTembak/180) * Double(waktu) )
    }
    func yProyektilTerhadapWaktuEngine(kecepatanAwal: Float, sudutTembak: Double, waktu: Float, gravitasi: Float)
    -> CGFloat {
        let part1 = (kecepatanAwal * poinKeMeter * Float(__sinpi(sudutTembak/180) * Double(waktu)))
        let part2 = (0.5 * pow(Float(waktu), 2) * gravitasi * 150)
        return CGFloat(part1 + part2)
    }
    func yProyektilTerhadapWaktuReal(kecepatanAwal: Float, sudutTembak: Double, waktu: Float, gravitasi: Float)
    -> CGFloat {
        let part1 = (kecepatanAwal * Float(__sinpi(sudutTembak/180) * Double(waktu)))
        let part2 = (0.5 * pow(Float(waktu), 2) * -gravitasi)
        return CGFloat(part1 - part2)
    }
    func kecepatanY(sudutTembak: Double, kecepatanAwal: Float, waktu: Float, gravitasi: Float) -> CGFloat {
        return CGFloat((kecepatanAwal * Float(__sinpi(sudutTembak/180))) - (-gravitasi * waktu))
    }
}
