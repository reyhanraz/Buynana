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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        if let rect = self.navigationController?.navigationBar.frame {
                let y = rect.size.height
            self.tableView.contentInset = UIEdgeInsets( top: -y, left: 0, bottom: 0, right: 0)
            }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCellImage") as! CustomCellImage
            
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellProgressBar") as! CustomCellProgressBar
            cell.image1.image = UIImage(named: "DSC08830")
            cell.image2.image = UIImage(named: "DSC08830")
            cell.image3.image = UIImage(named: "DSC08830")
            
            cell.progressBar.setProgress(0.6, animated: true)
            
            cell.label1.text = "Mentah"
            cell.label2.text = "Matang"
            cell.label3.text = "Busuk"
            return cell
        }else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellButton") as! customCellButton
        
            
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellHeaderandDeteil") as! CustomCellHeaderandDetail
            
            switch indexPath.row {
            case 3:
                cell.labelHeader.text = "Umur Pisang"
                cell.labelDetail.text = "Pisang Ambon"
            case 4:
                cell.labelHeader.text = "Cara Penyimpanan"
                cell.labelDetail.text = "Simpan dalam Kulkas Selama 4 Hari"
            default:
                cell.labelHeader.text = "Jenis Pisang"
                cell.labelDetail.text = "Pisang Ambon"
            }
            return cell

        }
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}
