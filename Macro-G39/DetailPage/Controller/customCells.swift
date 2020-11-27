//
//  customCells.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 21/10/20.
//

import UIKit

class CustomCellImage: UITableViewCell{
    @IBOutlet weak var imageTop: UIImageView!

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
        progressBar.layer.cornerRadius = 7
        image1.layer.cornerRadius = 10
        image2.layer.cornerRadius = 10
        image3.layer.cornerRadius = 10
        
        let gradientImage = UIImage.gradientImage(with: progressBar.frame,
                                                  locations: [0.0, 1.0])?.withHorizontallyFlippedOrientation()
        progressBar.transform = CGAffineTransform(scaleX: -1.0, y: -1.0)
        progressBar.roundCorners(corners: .allCorners, radius: 7.0)
        progressBar.trackImage = gradientImage
        progressBar.progressTintColor = UIColor.customColor.tintColor

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        progressBar.transform = CGAffineTransform(scaleX: -1.0, y: -1.0)
        progressBar.roundCorners(corners: .allCorners, radius: 7.0)
    }
}

class customCellButton: UITableViewCell{
    
    weak var delegate: customCellButtonDelegate?
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttonNext.setTitle("Lihat resep 􀆊", for: .normal)

        buttonNext.backgroundColor = UIColor.customColor.customYellow

        buttonNext.layer.shadowColor = UIColor(netHex: 0xCCAD5B).cgColor

        buttonNext.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        buttonNext.layer.shadowOpacity = 1.0
        buttonNext.layer.shadowRadius = 0.0
        buttonNext.layer.masksToBounds = false
        buttonNext.layer.cornerRadius = 12.5

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        view.backgroundColor = UIColor.customColor.customOrange
    }
    
    @IBAction func toRecipetapped(){
        delegate?.didTapButton()
    }

}

class CustomCellCaraPenyimpanan: UITableViewCell{
        
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelInstruction: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = UIColor.customColor.customWhite
        containerView.backgroundColor = UIColor.clear
        containerView.layer.cornerRadius = 12
    }

}


protocol customCellButtonDelegate: AnyObject {
    func didTapButton()
}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UIImage {
    static func gradientImage(with bounds: CGRect,
                            locations: [NSNumber]?) -> UIImage? {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.customColor.progressGreen.cgColor, UIColor.customColor.progressYellow.cgColor, UIColor.customColor.progressBrown.cgColor]

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
    func rotate(radians: Float) -> UIImage? {
            var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
            newSize.width = floor(newSize.width)
            newSize.height = floor(newSize.height)

            UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
            let context = UIGraphicsGetCurrentContext()!

            context.translateBy(x: newSize.width/2, y: newSize.height/2)
            context.rotate(by: CGFloat(radians))
            self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return newImage
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
        static let customOrange = UIColor(red: 205/255, green: 120/255, blue: 77/255, alpha: 1.0)
        static let customWhite = UIColor(netHex: 0xFDF6E4)
        static let progressGreen = UIColor(netHex: 0x92BD02)
        static let progressYellow = UIColor(netHex: 0xFFCB00)
        static let progressBrown = UIColor(netHex: 0x3D2C00)
        static let tintColor = UIColor(netHex: 0xE1DDD2)

    }
}
