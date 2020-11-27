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
    var filteredData:[Resep]!
    var bananaType = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeCollectionView.register(UINib.init(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recipeCell")
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.navigationBar.isHidden = false
        
        searchController.searchBar.placeholder = "Search Recipes"
        searchController.searchBar.delegate = self
        
        recipeCollectionView.delegate = self
        recipeCollectionView.dataSource = self
        
        filteredData = listResep
        if !bananaType.isEmpty{
            searchController.searchBar.text = bananaType
            searchBar(searchController.searchBar, textDidChange: bananaType)
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false

    }
}
extension RecipeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCollectionViewCell
        cell.recipeNameLabel.text = filteredData[indexPath.row].namaRecipe
        cell.bananaRipenessLabel.text = filteredData[indexPath.row].tingkatKematangan.rawValue
        cell.bananaTypeLabel.text = filteredData[indexPath.row].jenisPisang.rawValue
        cell.recipeImage.image = UIImage(named: filteredData[indexPath.row].gambarRecipe)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let resep = listResep[indexPath.row]
        performSegue(withIdentifier: "toDetailRecipe", sender: resep)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DetailRecipeVC{
            dest.Resep = (sender as! Resep)
            dest.source = .Recipe
        }
    }
    
    
}

extension RecipeVC: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        filteredData = listResep
        self.recipeCollectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            filteredData = listResep
        } else {
//            for recipe in listResep {
//                if recipe.namaRecipe.lowercased().contains(searchText.lowercased()){
//                    filteredData.append(recipe)
//                }
//            }
            filteredData = listResep.filter ({$0.namaRecipe.lowercased().range(of: searchText.lowercased()) != nil})
            filteredData += listResep.filter ({$0.jenisPisang.rawValue.lowercased().range(of: searchText.lowercased()) != nil})
        }
        self.recipeCollectionView.reloadData()
    }
}
