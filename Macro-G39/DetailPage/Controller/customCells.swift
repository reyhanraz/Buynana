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
    @IBOutlet weak var viewCont1: UIView!
    @IBOutlet weak var viewCont2: UIView!
    @IBOutlet weak var viewCont3: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.backgroundColor = UIColor.customColor.customWhite
        viewCont1.backgroundColor = UIColor.customColor.customWhite
        viewCont2.backgroundColor = UIColor.customColor.customWhite
        viewCont3.backgroundColor = UIColor.customColor.customWhite

        let colorStart = UIColor(red: 0.573, green: 0.741, blue: 0.007, alpha: 1).cgColor
        let colorEnd = UIColor(red: 0.667, green: 0.49, blue: 0.015, alpha: 1).cgColor
        let gradientImage = UIImage.gradientImage(with: progressBar.frame,
                                                colors: [colorStart, colorEnd],
                                                locations: nil)
        progressBar.progressImage = gradientImage
        progressBar.roundCorners(corners: [.allCorners], radius: 7)
        image1.roundCorners(corners: [.allCorners], radius: 10)
        image2.roundCorners(corners: [.allCorners], radius: 10)
        image3.roundCorners(corners: [.allCorners], radius: 10)
    }
}

class customCellButton: UITableViewCell{
    
    @IBOutlet weak var buttonNext: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttonNext.backgroundColor = UIColor.customColor.customYellow
        buttonNext.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        buttonNext.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        buttonNext.layer.shadowOpacity = 1.0
        buttonNext.layer.shadowRadius = 0.0
        buttonNext.layer.masksToBounds = false
        buttonNext.layer.cornerRadius = 25
        
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

fileprivate extension UIImage {
    static func gradientImage(with bounds: CGRect,
                            colors: [CGColor],
                            locations: [NSNumber]?) -> UIImage? {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        // This makes it horizontal
        gradientLayer.startPoint = CGPoint(x: 0.0,
                                        y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0,
                                        y: 0.5)

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    struct customColor {
        static let customYellow = UIColor.init(netHex: 0xF6D275)
        static let customBlue = UIColor(netHex: 0xF6D275)
        static let customOrange = UIColor(netHex: 0xCD784D)
        static let customWhite = UIColor(netHex: 0xFBF6E8)
    }
}
