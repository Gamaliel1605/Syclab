//
//  HomeController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var homeCollection: UICollectionView!
    let getData = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Experimen"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30),NSAttributedString.Key.foregroundColor: UIColor.yellow]
        setupView()
    }

}


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupView(){
        RegisterNib.registerCollectionViewNib(nibName: "HomeCell", collectionView: homeCollection, cellId: "homeCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getData.homeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollection.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCell
        cell.expLabel.text = getData.homeData[indexPath.row].expName
        cell.expImageHome.image = UIImage(named: "\(getData.homeData[indexPath.row].expImage)")
        
        return cell
    }
    
    
}
