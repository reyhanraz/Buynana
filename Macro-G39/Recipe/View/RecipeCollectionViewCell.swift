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

        //code shadow
        RecipeView.layer.shadowOpacity = 0.4
        RecipeView.layer.shadowOffset = CGSize (width: 0, height: 4)
        RecipeView.layer.shadowColor = #colorLiteral(red: 0.6575118303, green: 0.6163470745, blue: 0.4697498679, alpha: 1)
        RecipeView.layer.shadowRadius = 0.5
        
        //gradient code
        gl.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gl.locations = [0.0,1.0]
        gl.frame = blackOverlay.frame
        blackOverlay.layer.addSublayer(gl)
        blackOverlay.layer.cornerRadius = 20
        blackOverlay.clipsToBounds = true
        
        //image code
        recipeImage.contentMode = .scaleAspectFill
        recipeImage.layer.cornerRadius = 20
        recipeImage.clipsToBounds = true
    }
}
