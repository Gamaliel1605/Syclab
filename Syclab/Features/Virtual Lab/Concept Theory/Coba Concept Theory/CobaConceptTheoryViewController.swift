//
//  CobaConceptTheoryViewController.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 02/11/21.
//

import UIKit

class CobaConceptTheoryViewController: UIViewController {
    
    let conceptTheory: Experiments = .E1_GerakParabola
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func conceptTheoryButton(_ sender: UIButton) {
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        backgroundView.backgroundColor = .black.withAlphaComponent(0.3)
        backgroundView.tag = 100
        self.view.addSubview(backgroundView)
        
        let conceptTheoryView = ConceptTheory(frame: CGRect(x: self.view.center.x - (843/2),
                                                            y: self.view.center.y - (620/2),
                                                            width: 843,
                                                            height: 620)
        )
        conceptTheoryView.delegate = self
        
        backgroundView.addSubview(conceptTheoryView)
        
        let conceptTheoryContentView = UIView()
        conceptTheoryView.scrollView.addSubview(conceptTheoryContentView)
        conceptTheoryContentView.translatesAutoresizingMaskIntoConstraints = false
        conceptTheoryContentView.topAnchor.constraint(equalTo: conceptTheoryView.scrollView.topAnchor).isActive = true
        conceptTheoryContentView.leadingAnchor.constraint(equalTo: conceptTheoryView.scrollView.leadingAnchor).isActive = true
        conceptTheoryContentView.trailingAnchor.constraint(equalTo: conceptTheoryView.scrollView.trailingAnchor).isActive = true
        conceptTheoryContentView.bottomAnchor.constraint(equalTo: conceptTheoryView.scrollView.bottomAnchor).isActive = true
        conceptTheoryContentView.widthAnchor.constraint(equalTo: conceptTheoryView.scrollView.widthAnchor).isActive = true
        
        var elements = [UIView]()
        
        let conceptTheoryContents = conceptTheory.getConceptTheory().conceptTheory
        for (index, conceptTheoryContent) in conceptTheoryContents.enumerated() {
            if (conceptTheoryContent is ContentImage) {
                let imageView = (conceptTheoryContent as! ContentImage).create(
                    elementsContainer: conceptTheoryContentView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: conceptTheoryContents.endIndex - 1
                )
                elements.append(imageView)
            } else if (conceptTheoryContent is ContentLabel) {
                let label = (conceptTheoryContent as! ContentLabel).create(
                    elementsContainer: conceptTheoryContentView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: conceptTheoryContents.endIndex - 1
                )
                elements.append(label)
            }
        }
    }
}

extension CobaConceptTheoryViewController: DismissProtocol {
    func dismissView() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
}
