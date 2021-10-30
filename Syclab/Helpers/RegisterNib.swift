//
//  RegisterNib.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 23/10/21.
//

import Foundation
import UIKit

class RegisterNib {
    
    static func registerCollectionViewNib(nibName: String, collectionView: UICollectionView, cellId id: String ) {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: id)
    }
    
}
