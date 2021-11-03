//
//  ConceptTheory.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 01/11/21.
//

import UIKit

class ConceptTheory: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubviews()
    }

    @IBAction func closeButton(_ sender: UIButton) {
    }
    
    private func initSubviews() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
        titleLabel.text = "Teori Konsep"
        closeView.layer.cornerRadius = 15
        containerView.layer.cornerRadius = 15
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: containerView.topAnchor),
            self.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
