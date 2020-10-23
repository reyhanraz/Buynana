//
//  customCells.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 21/10/20.
//

import UIKit

class CustomCellImage: UITableViewCell{
   

    @IBOutlet weak var imageTop: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageTop.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 50)
    }
}

class CustomCellProgressBar: UITableViewCell{
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        progressBar.progressTintColor = UIColor(red: 0.96, green: 0.82, blue: 0.46, alpha: 1)
        progressBar.roundCorners(corners: [.allCorners], radius: 7)
        image1.roundCorners(corners: [.allCorners], radius: 10)
        image1.roundCorners(corners: [.allCorners], radius: 10)
        image2.roundCorners(corners: [.allCorners], radius: 10)
        image3.roundCorners(corners: [.allCorners], radius: 10)
    }
}

class CustomCellHeaderandDetail: UITableViewCell{
    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var labelDetail: UILabel!

}

class customCellButton: UITableViewCell{
    
    @IBOutlet weak var buttonNext: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttonNext.backgroundColor = UIColor(red: 0.11, green: 0.13, blue: 0.29, alpha: 1)
        buttonNext.layer.cornerRadius = 15
    }

}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
