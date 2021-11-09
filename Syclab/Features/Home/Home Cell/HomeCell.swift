//
//  HomeCell.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 23/10/21.
//

import UIKit

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var expImageHome: UIImageView!
    @IBOutlet weak var expLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 11
        expImageHome.layer.cornerRadius = 8
    }

}
