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
        containerView.backgroundColor = UIColor(red: 0.96, green: 0.82, blue: 0.46, alpha: 1)
        containerView.roundCorners(corners: [.allCorners], radius: 12)
    }
    
}
