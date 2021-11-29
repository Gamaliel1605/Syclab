//
//  CobaLabInstructionsViewController.swift
//  Syclab
//
//  Created by Ivan Kelvin Trisno on 03/11/21.
//

import UIKit

class CobaLabInstructionsViewController: UIViewController {
    
    let virtualLabVM: VirtualLabViewModel = VirtualLabViewModel(check: .Eksplorasi, experiment: .E1_GerakParabola)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openInstructionsLab(_ sender: UIButton) {
        let labInstructionsView = LabInstructions(frame: CGRect(x: self.view.bounds.width - (367+20),
                                                                y: 40,
                                                                width: 367,
                                                                height: 527)
        )
        labInstructionsView.delegate = self
        labInstructionsView.tag = 100
        self.view.addSubview(labInstructionsView)
        
        let labInstructionsContentView = UIView()
        labInstructionsView.scrollView.addSubview(labInstructionsContentView)
        labInstructionsContentView.translatesAutoresizingMaskIntoConstraints = false
        labInstructionsContentView.topAnchor.constraint(equalTo: labInstructionsView.scrollView.topAnchor).isActive = true
        labInstructionsContentView.leadingAnchor.constraint(equalTo: labInstructionsView.scrollView.leadingAnchor).isActive = true
        labInstructionsContentView.trailingAnchor.constraint(equalTo: labInstructionsView.scrollView.trailingAnchor).isActive = true
        labInstructionsContentView.bottomAnchor.constraint(equalTo: labInstructionsView.scrollView.bottomAnchor).isActive = true
        labInstructionsContentView.widthAnchor.constraint(equalTo: labInstructionsView.scrollView.widthAnchor).isActive = true
        
        var elements = [UIView]()
        
        let experiment = virtualLabVM.experiment
        var labInstructionsContents: [Any] = []
        
        switch virtualLabVM.check {
        case .Eksplorasi:
            labInstructionsContents = experiment.getExplorationLabInstruction().labInstructions
        case .Misi:
            labInstructionsContents = experiment.getMissionLabInstruction().labInstructions
        default:
            ()
        }
        
        for (index, labInstructionsContent) in labInstructionsContents.enumerated() {
            if(labInstructionsContent is ContentImage) {
                let imageView = (labInstructionsContent as! ContentImage).create(
                    elementsContainer: labInstructionsContentView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: labInstructionsContents.endIndex - 1
                )
                elements.append(imageView)
            } else if (labInstructionsContent is ContentLabel) {
                let label = (labInstructionsContent as! ContentLabel).create(
                    elementsContainer: labInstructionsContentView,
                    elementIndex: index,
                    elements: elements,
                    lastElementIndex: labInstructionsContents.endIndex - 1
                )
                elements.append(label)
            }
        }
    }
}

extension CobaLabInstructionsViewController: DismissProtocol {
    func dismissView() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
}
