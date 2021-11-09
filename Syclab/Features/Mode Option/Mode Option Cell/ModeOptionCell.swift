//
//  ModeOptionCell.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 25/10/21.
//

import UIKit

class ModeOptionCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var modeImage: UIImageView!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    var selectedExperiment: Experiments?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 11
        modeImage.layer.cornerRadius = 8
    }

}
