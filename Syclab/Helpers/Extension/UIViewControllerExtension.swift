//
//  UIViewControllerExtension.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 28/11/21.
//

import UIKit

extension UIViewController {
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotifications(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardNotifications(notification: NSNotification) {
        var txtFieldY: CGFloat = 0.0
        let spaceBetweenTxtFieldAndKeyboard: CGFloat = 5.0
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        if let activeTextField = UIResponder.currentFirst() as? UITextField ?? UIResponder.currentFirst() as? UITextView {
            frame = self.view.convert(activeTextField.frame, from: activeTextField.superview)
            txtFieldY = frame.origin.y + frame.size.height
        }
        
        if let userInfo = notification.userInfo {
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let keyboardFrameY = keyboardFrame!.origin.y
            let keyboardFrameHeight = keyboardFrame!.size.height
            
            var viewOriginY: CGFloat = 0.0
            if keyboardFrameY >= UIScreen.main.bounds.size.height {
                viewOriginY = 0.0
            } else {
                if txtFieldY >= keyboardFrameY {
                    viewOriginY = (txtFieldY - keyboardFrameY) + spaceBetweenTxtFieldAndKeyboard
                    if viewOriginY > keyboardFrameHeight { viewOriginY = keyboardFrameHeight }
                }
            }
            self.view.frame.origin.y = -viewOriginY
        }
    }
}
