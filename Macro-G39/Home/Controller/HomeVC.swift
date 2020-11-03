//
//  HomeVC.swift
//  Macro-G39
//
//  Created by Muhammad Rivan Rayhan on 21/10/20.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeCell")
        
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor.customColor.customOrange
        self.navigationController?.navigationBar.barTintColor = UIColor.customColor.customWhite
        self.navigationController?.navigationBar.isTranslucent = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        // Do any additional setup after loading the view.
    }
      
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func goToRecipePage(_ sender: Any) {
        performSegue(withIdentifier: "segueToRecipe", sender: nil)
    }
    @IBAction func goToCameraPage(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToCamera", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? RecipeVC {
            self.navigationController?.navigationBar.isHidden = false
        }
        if let dest = segue.destination as? MainController {
            self.navigationController?.navigationBar.isHidden = false
        }
    }

}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        
        return cell
    }
    
    
}
