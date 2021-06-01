//
//  ViewController.swift
//  SwiftlyAdds
//
//  Created by MARIJAN VUKCEVICH on 5/27/21.
//

import UIKit

class ViewController: UIViewController {

    var managerViewModel:ManagerSpecialsViewModel?
    
    var  managerCollectionVC: ManagerCollectionController?
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        managerViewModel = ManagerSpecialsViewModel(delegate: self)
        
        managerViewModel?.fetchManagerSpecialContnents(completion: { [weak self] result in
    
            switch result {
            
            case.failure(let response, let errorMessage) :
                print("response:", response as Any)
                print("response:", errorMessage)
            case .success(let managerModel, _) :
               
                DispatchQueue.main.async {
                    self?.managerCollectionVC = ManagerCollectionController(collectionViewLayout: self!.layout)
                    self!.managerCollectionVC?.managerModel = managerModel as? ManagerSpecialsModel
                    self!.managerCollectionVC?.title = "Adds MGR"
                    self?.present((self?.managerCollectionVC)!, animated: true, completion: nil)
                   
                }
            }
        })
    }

}

extension ViewController: ManagerSpecialsViewModelProtocol {
    
}

