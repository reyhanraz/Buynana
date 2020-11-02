//
//  customCellDetailRecipe.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 22/10/20.
//

import UIKit

class CustomCellImageRecipe: UITableViewCell{
    @IBOutlet weak var imageTop: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageTop.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 50)
    }
}

class CustomCellInstruction: UITableViewCell{
        
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelInstruction: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.backgroundColor = UIColor.customColor.customYellow
        containerView.layer.cornerRadius = 12
    }
}
