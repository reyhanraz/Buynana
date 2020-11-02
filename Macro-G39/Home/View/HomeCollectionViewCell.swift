//
//  HomeCollectionViewCell.swift
//  Macro-G39
//
//  Created by Muhammad Rivan Rayhan on 26/10/20.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.recipeImageView.layer.cornerRadius = 20
    }

}
