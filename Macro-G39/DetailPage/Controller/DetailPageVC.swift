//
//  DetailPageVC.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 05/10/20.
//

import UIKit

class DetailPageVC: UITableViewController {
    
    weak var delegate: ModalHandler!
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.customColor.customWhite

        let image = UIImage(systemName: "house")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(HomeTapped))
        self.navigationController?.navigationBar.tintColor = UIColor.customColor.customOrange
        self.navigationController?.navigationBar.barTintColor = UIColor.customColor.customWhite

        self.navigationController?.navigationBar.isTranslucent = true
        self.title = "Detail Pisang"
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func HomeTapped(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCellImage") as! CustomCellImage
            cell.contentView.backgroundColor = UIColor.customColor.customWhite
            cell.imageTop.image = self.image
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellProgressBar") as! CustomCellProgressBar
            cell.progressBar.setProgress((100-80)/100, animated: true)
            
            cell.label1.text = "Mentah"
            cell.label2.text = "Matang"
            cell.label3.text = "Busuk"
            
            cell.backgroundColor = UIColor.customColor.customWhite
            return cell
        }else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellButton") as! customCellButton
            cell.delegate = self

            cell.contentView.backgroundColor = UIColor.customColor.customWhite
            return cell
        } else{
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.customColor.customWhite
            switch indexPath.section {
            case 3:
                cell.textLabel?.text = "Pisang Ambon"
            case 4:
                cell.textLabel?.text = "Simpan dalam Kulkas Selama 4 Hari"
            default:
                cell.textLabel?.text = "Pisang Ambon"
            }
            cell.textLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont.customFont.body!)
            cell.textLabel?.adjustsFontForContentSizeCategory = true
            return cell

        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Jenis Pisang"
        case 2:
            return "Tingkat Kematangan"
        case 3:
            return "Umur Pisang"
        case 4:
            return "Tips and Trick"
        default:
           return ""
        }
    }
    

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return  18
        }
    }
    

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2{
            return 24
        }
        return 16
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let myLabel = UILabel()
            myLabel.frame = CGRect(x: view.layoutMargins.left, y: 0, width: 300, height: 18)
            myLabel.font = UIFontMetrics.default.scaledFont(for: UIFont.customFont.heading!)
            myLabel.adjustsFontForContentSizeCategory = true
            myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            headerView.addSubview(myLabel)
            return headerView
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.backgroundColor = UIColor.clear
        return footer
    }

}
extension DetailPageVC: customCellButtonDelegate{
    
    func didTapButton() {
        self.navigationController?.popViewControllerWithHandler {
            self.delegate?.modalDismissed()
        }
    }
}
extension UINavigationController {
    func popViewControllerWithHandler(handler: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(handler)
        self.popViewController(animated: true)
        CATransaction.commit()
    }
}
extension UIFont{
    struct customFont {
        static let heading = UIFont(name: "SFCompactDisplay-Bold", size: 16)
        static let body = UIFont(name: "SFCompactDisplay-Regular", size: 16)
    }
}
