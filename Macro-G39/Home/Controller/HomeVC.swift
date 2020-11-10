//
//  HomeVC.swift
//  Macro-G39
//
//  Created by Muhammad Rivan Rayhan on 21/10/20.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var cameraButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeCell")
        
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey:"isFirstTime")
            let storyBoard = UIStoryboard(name: "OnboardingSB", bundle: nil)
            let mainViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }
    }
    
    func setUpView() {
        self.navigationController?.navigationBar.tintColor = UIColor.customColor.customOrange
        self.navigationController?.navigationBar.barTintColor = UIColor.customColor.customWhite
        self.navigationController?.navigationBar.isTranslucent = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        cameraButton.setBackgroundImage(UIImage(named: "Deteksi_pisang_button-1"), for: .normal)
        cameraButton.backgroundColor = UIColor.clear
        cameraButton.contentVerticalAlignment = .fill
        cameraButton.contentHorizontalAlignment = .fill
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
        if segue.destination is RecipeVC {
            self.navigationController?.navigationBar.isHidden = false
        }
        if segue.destination is MainController {
            self.navigationController?.navigationBar.isHidden = true
        }
        if let dest = segue.destination as? DetailRecipeVC{
            dest.Resep = (sender as! Resep)
        }
    }

}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listResep.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        cell.recipeNameLabel.text = listResep[indexPath.row].namaRecipe
        cell.recipeImageView.image = UIImage(named: listResep[indexPath.row].gambarRecipe)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let resep = listResep[indexPath.row]
        performSegue(withIdentifier: "segueToDetail", sender: resep)
    }
    
}
