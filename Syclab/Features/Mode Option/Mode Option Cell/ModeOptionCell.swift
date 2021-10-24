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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 11
    }

}
