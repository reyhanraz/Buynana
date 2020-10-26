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
    }
    @IBAction func goToRecipePage(_ sender: Any) {
        performSegue(withIdentifier: "segueToRecipe", sender: nil)
    }
    @IBAction func goToCameraPage(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToCamera", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? RecipeVC {
            
        }
        if let dest = segue.destination as? CameraVC {
            
        }
    }

}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        cell.recipeNameLabel.text = "JALAN"
        return cell
    }
    
    
}
