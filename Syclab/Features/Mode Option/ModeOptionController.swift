//
//  ModeOptionController.swift
//  Syclab
//
//  Created by Carlos Gamaliel Manurung on 19/10/21.
//

import UIKit

class ModeOptionController: UIViewController {

    @IBOutlet weak var modeCollection: UICollectionView!
    
    var getTitleMode: String!
    var modeOptionVM: ModeOptionViewModel!
    let getDataHome = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        self.navigationItem.title = modeOptionVM.title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}

extension ModeOptionController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupView(){
        RegisterNib.registerCollectionViewNib(nibName: "ModeOptionCell", collectionView: modeCollection, cellId: "modeCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modeOptionVM.experimentOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = modeCollection.dequeueReusableCell(withReuseIdentifier: "modeCell", for: indexPath) as! ModeOptionCell
        let option = modeOptionVM.experimentOptions[indexPath.row]
        cell.modeLabel.text = option.optionTitle.rawValue
        cell.descLabel.text = option.optionDesc
        cell.modeImage.image = UIImage(named: option.optionImgStr)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "ExperimentDetail", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "expDetail") as! ExperimentDetailController
            viewController.experimentVM = ExperimentDetailViewModel(experiments: modeOptionVM.experiment, check: modeOptionVM.experimentOptions[indexPath.row].optionTitle)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        else {
            let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "quiz") as! QuizController
            viewController.quizVM = QuizViewModel(experiment: modeOptionVM.experiment)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
