//
//  DetailRecipeVC.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 22/10/20.
//

import UIKit

class DetailRecipeVC: UITableViewController {

    var Resep: Resep?
    override func viewDidLoad() {
        Resep = listResep[10]
        self.view.backgroundColor = UIColor.customColor.customWhite
        let image = UIImage(systemName: "house")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(HomeTapped))
        self.navigationController?.navigationBar.tintColor = UIColor.customColor.customOrange
        self.navigationController?.navigationBar.barTintColor = UIColor.customColor.customWhite
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = Resep?.namaRecipe
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    @objc func HomeTapped(){
        self.navigationController?.popToRootViewController(animated: true)
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3{

            return Resep?.instruksiRecipe.count ?? 0
        }else if section == 2{
            return Resep?.bahanRecipe.count ?? 0

        }else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "a"

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
            cell.imageView?.image = UIImage(named: Resep!.gambarRecipe)
            
            return cell
        }else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellInstruction") as! CustomCellInstruction

            let arr = Resep?.instruksiRecipe
            cell.backgroundColor = UIColor.customColor.customWhite
            cell.labelNumber.text = "\(indexPath.row + 1)."
            cell.labelInstruction.text = "\(arr![indexPath.row])"
            

            return cell
        }else{
            let cell = UITableViewCell()
            switch indexPath.section{
            case 1:
                cell.textLabel?.text = "Makanan ringan berbahan dasar pisang dibungkus dengan adonan dan digoreng dengan minyak panas"
            default:

                let arr = Resep?.bahanRecipe
                cell.textLabel?.text = " • \(arr![indexPath.row]) \n"

            }
            cell.backgroundColor = UIColor.customColor.customWhite
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1{
            return 0
        }else{
            return 18
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: view.layoutMargins.left, y: 0, width: 300, height: 18)
        myLabel.font = UIFont.boldSystemFont(ofSize: 16)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        headerView.addSubview(myLabel)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 3{
            return 0
        }else{
            return 16
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // UIView with darkGray background for section-separators as Section Footer
        
        let v = UIView(frame: CGRect(x: view.layoutMargins.left, y:0, width: UIScreen.main.bounds.width - view.layoutMargins.left*2, height: 1))
        v.backgroundColor = .gray
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        headerView.addSubview(v)
        
        return headerView

    }
    

}
