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
    let gl = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.RecipeView.layer.cornerRadius = 20
        self.RecipeView.layer.borderColor = UIColor.gray.cgColor
        self.RecipeView.layer.borderWidth = 1
        // Initialization code
        
        
        
        gl.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gl.locations = [0.0,1.0]
        gl.frame = blackOverlay.frame
        blackOverlay.layer.addSublayer(gl)
        blackOverlay.layer.cornerRadius = 20
        blackOverlay.clipsToBounds = true
    }
}
