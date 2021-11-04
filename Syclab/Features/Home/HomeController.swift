//
//  HomeController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var homeCollection: UICollectionView!
    let homeVM = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupView(){
        RegisterNib.registerCollectionViewNib(nibName: "HomeCell", collectionView: homeCollection, cellId: "homeCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVM.expDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollection.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCell
        cell.expLabel.text = homeVM.expDatas[indexPath.row].expTitle
        cell.expImageHome.image = UIImage(named: homeVM.expDatas[indexPath.row].expImage)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyborad = UIStoryboard(name: "ModeOption", bundle: nil)
        let viewController = storyborad.instantiateViewController(withIdentifier: "modeOption") as! ModeOptionController
        viewController.modeOptionVM = ModeOptionViewModel(experiment: homeVM.expDatas[indexPath.row].id)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
