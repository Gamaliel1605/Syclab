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
        
        setupView()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.centerTitle(animated: true)
//    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = getData.homeData[indexPath.row]
        let storyborad = UIStoryboard(name: "ModeOption", bundle: nil)
        let viewController = storyborad.instantiateViewController(withIdentifier: "modeOption") as! ModeOptionController
        viewController.getTitleMode = cell.expName
        self.navigationController?.pushViewController(viewController, animated: true)
        print(getData.homeData[indexPath.row].expName)
    }
    
}

//extension UIViewController{
//    func centerTitle(){
//        for navItem in(self.navigationController?.navigationBar.subviews)! {
//             for itemSubView in navItem.subviews {
//                 if let largeLabel = itemSubView as? UILabel {
//                    largeLabel.center = CGPoint(x: navItem.bounds.width/2, y: navItem.bounds.height/2)
//                    
//                    return;
//                 }
//             }
//        }
//    }
//}

