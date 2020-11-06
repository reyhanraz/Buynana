//
//  HomeCollectionViewCell.swift
//  Macro-G39
//
//  Created by Muhammad Rivan Rayhan on 26/10/20.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var recipeView: UIView!
    @IBOutlet weak var blackOverlay: UIView!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    let gl = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.recipeImageView.layer.cornerRadius = 20
        
        recipeNameLabel.textColor = UIColor.white
        
        //code shadow
        recipeView.layer.cornerRadius = 20
        recipeView.layer.shadowOpacity = 1
        recipeView.layer.shadowOffset = CGSize (width: 0, height: 4)
        recipeView.layer.shadowColor = #colorLiteral(red: 0.6575118303, green: 0.6163470745, blue: 0.4697498679, alpha: 1)
        recipeView.layer.shadowRadius = 1
        
        //gradient code
        gl.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gl.frame = blackOverlay.frame
        gl.locations = [0.0,1.0]
        blackOverlay.layer.addSublayer(gl)
        blackOverlay.layer.cornerRadius = 20
        blackOverlay.clipsToBounds = true
        
        //image code
        recipeImageView.contentMode = .scaleAspectFill
        recipeImageView.layer.cornerRadius = 20
        recipeImageView.clipsToBounds = true
        
    }

}
