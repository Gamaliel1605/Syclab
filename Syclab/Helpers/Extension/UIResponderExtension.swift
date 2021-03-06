//
//  UIResponderExtension.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 28/11/21.
//

import UIKit

extension UIResponder {
    static weak var responder: UIResponder?
    
    static func currentFirst() -> UIResponder? {
        responder = nil
        UIApplication.shared.sendAction(#selector(trap), to: nil, from: nil, for: nil)
        return responder
    }
    
    @objc private func trap() {
        UIResponder.responder = self
    }
}
