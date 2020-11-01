//
//  CollectionViewCell.swift
//  Macro-G39
//
//  Created by Muhammad Rivan Rayhan on 23/10/20.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var RecipeView: UIView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var bananaRipenessLabel: UILabel!
    @IBOutlet weak var bananaTypeLabel: UILabel!
    @IBOutlet weak var blackOverlay: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.RecipeView.layer.cornerRadius = 20
        self.RecipeView.layer.borderColor = UIColor.gray.cgColor
        self.RecipeView.layer.borderWidth = 1
        // Initialization code
    }

}
