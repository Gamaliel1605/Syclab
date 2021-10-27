//
//  ModeOptionController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit

class ModeOptionController: UIViewController {

    @IBOutlet weak var modeCollection: UICollectionView!
    
    var getTitle: String!
    let getData = ModeOptionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        self.navigationItem.title = getTitle
    }

}

extension ModeOptionController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupView(){
        RegisterNib.registerCollectionViewNib(nibName: "ModeOptionCell", collectionView: modeCollection, cellId: "modeCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getData.modeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = modeCollection.dequeueReusableCell(withReuseIdentifier: "modeCell", for: indexPath) as! ModeOptionCell
        cell.modeLabel.text = getData.modeData[indexPath.row].modeLabel
        cell.modeImage.image = UIImage(named: "\(getData.modeData[indexPath.row].modeImage)")
        
        return cell
    }
}
