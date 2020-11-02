//
//  DetailPageVC.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 05/10/20.
//

import UIKit

class DetailPageVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.customColor.customWhite
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
//        if let rect = self.navigationController?.navigationBar.frame {
//                let y = rect.size.height
//            self.tableView.contentInset = UIEdgeInsets( top: -y, left: 0, bottom: 0, right: 0)
//            }
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
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
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellProgressBar") as! CustomCellProgressBar
            cell.image1.image = UIImage(named: "DSC08830")
            cell.image2.image = UIImage(named: "DSC08830")
            cell.image3.image = UIImage(named: "DSC08830")
            
            cell.progressBar.setProgress(0.6, animated: true)
            
            cell.label1.text = "Mentah"
            cell.label2.text = "Matang"
            cell.label3.text = "Busuk"
            return cell
        }else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellButton") as! customCellButton
        
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
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let myLabel = UILabel()
            
            myLabel.frame = CGRect(x: view.layoutMargins.left, y: 8, width: 300, height: 20)
                myLabel.font = UIFont.boldSystemFont(ofSize: 18)
                myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

                let headerView = UIView()
                headerView.backgroundColor = UIColor.clear
                headerView.addSubview(myLabel)


                return headerView
    }

}
