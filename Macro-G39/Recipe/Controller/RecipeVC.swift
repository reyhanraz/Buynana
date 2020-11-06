//
//  RecipeVC.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 05/10/20.
//

import UIKit

class RecipeVC: UIViewController{

    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeCollectionView.register(UINib.init(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recipeCell")
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.navigationBar.isHidden = false
        
        searchController.searchBar.delegate = self
        recipeCollectionView.delegate = self
        recipeCollectionView.dataSource = self
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false

    }
}
extension RecipeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listResep.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCollectionViewCell
        cell.recipeNameLabel.text = listResep[indexPath.row].namaRecipe
        cell.bananaRipenessLabel.text = listResep[indexPath.row].tingkatKematangan.rawValue
        cell.bananaTypeLabel.text = listResep[indexPath.row].jenisPisang.rawValue
        cell.recipeImage.image = UIImage(named: listResep[indexPath.row].gambarRecipe)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let resep = listResep[indexPath.row]
        performSegue(withIdentifier: "toDetailRecipe", sender: resep)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DetailRecipeVC{
            dest.Resep = (sender as! Resep)
        }
    }
    
    
}

extension RecipeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
