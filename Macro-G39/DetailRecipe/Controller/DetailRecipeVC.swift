//
//  DetailRecipeVC.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 22/10/20.
//

import UIKit

class DetailRecipeVC: UITableViewController {
    
    let arr = ["a", "b", "c", "d"]
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
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3{
            return arr.count
        }else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Pisang Goreng"
        case 2:
            return "Bahan - Bahan"
        case 3:
            return "Instruction"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCellImageRecipe") as! CustomCellImageRecipe
            
            return cell
        }else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellInstruction") as! CustomCellInstruction
            
            cell.backgroundColor = UIColor.customColor.customWhite
            cell.labelNumber.text = "\(indexPath.row + 1)."
            cell.labelInstruction.text = "\(arr[indexPath.row])"
            return cell
        }else{
            let cell = UITableViewCell()
            switch indexPath.section{
            case 1:
                cell.textLabel?.text = "Makanan ringan berbahan dasar pisang dibungkus dengan adonan dan digoreng dengan minyak panas"
            default:
                cell.textLabel?.text = "5 Buah Pisang \n 8 sdm tepung terigu"
            }
            cell.backgroundColor = UIColor.customColor.customWhite
            return cell
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
