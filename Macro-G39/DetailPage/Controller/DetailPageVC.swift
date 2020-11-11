//
//  DetailPageVC.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 05/10/20.
//

import UIKit
import Vision
import CoreML

class DetailPageVC: UITableViewController {
    
    let mainC = MainController()
    weak var delegate: ModalHandler!
    var image: UIImage?
    
    var typeAccuration:String = "--%"
    var typeBanana:String = "--"
    var ageAccuration:String = "--%"
    var ageBanana:String = "--"
    var ripeAccuration:String = "--%"
    var ripeBanana:String = "--"
    var isExpand = false
    let arrTips = ["a","b","c"]

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.customColor.customWhite

        let image = UIImage(systemName: "house")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(HomeTapped))
        self.navigationController?.navigationBar.tintColor = UIColor.customColor.customOrange


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
        switch section{
        case 4:
            if !isExpand{
                return 0
            }else{
                return arrTips.count
            }
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCellImage") as! CustomCellImage
            cell.imageTop.image = self.image
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellProgressBar") as! CustomCellProgressBar
            detectRipeImage()
            cell.progressBar.setProgress(1, animated: true)
            
            cell.label1.text = "Mentah"
            cell.label2.text = "Matang"
            cell.label3.text = "Busuk"
            
            if ripeBanana == "Mentah"{
                cell.progressBar.setProgress(1, animated: true)
            }else if ripeBanana == "Matang"{
                cell.progressBar.setProgress(50/100, animated: true)
            }else if ripeBanana == "Kematangan"{
                cell.progressBar.setProgress((100-75)/100, animated: true)
            }else{
                cell.progressBar.setProgress(0, animated: true)
            }
            
            return cell
        }else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellButton") as! customCellButton
            cell.delegate = self
            switch ripeBanana {
            case "Mentah":
                cell.label.text = "Eh, pisang kamu belum matang.. Tunggu matang [xx] hari lagi, ya!"
                cell.buttonNext.alpha = 0
            case "Matang":
                cell.label.text = "Wah, pisangnya udah matang nih! Bisa langsung dimakan, tapi diolah jadi cemilan juga enak!"
            case "Kematangan":
                cell.label.text = "Eits, pisang kamu yang kematangan ini masih bisa diolah jadi santapan lezat, kok!"
            default:
                cell.label.text = "Yah, pisang kamu udah terlalu busuk untuk dikonsumsi atau diolah lagi. :("
                cell.buttonNext.alpha = 0
            }
            return cell
        }else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellCaraPenyimpanan") as! CustomCellCaraPenyimpanan
            cell.backgroundColor = view.backgroundColor
            cell.labelNumber.text = "\(indexPath.row+1)."
            cell.labelInstruction.text = arrTips[indexPath.row]
            return cell
        } else{
            let cell = UITableViewCell()
            switch indexPath.section {
            case 3:
                detectAgeImage()
                cell.backgroundColor = view.backgroundColor
                    cell.textLabel?.text = "\(ageBanana)"
                    cell.textLabel?.text = "\(ageBanana) hari menuju busuk"
            case 4:
                cell.backgroundColor = view.backgroundColor
                cell.textLabel?.text = "Simpan dalam Kulkas Selama 4 Hari"
            default:
                detectTypeImage()
                cell.backgroundColor = view.backgroundColor
                    cell.textLabel?.text = "\(typeBanana)"
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
            return "Cara Penyimpanan"
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
            let button = UIButton()
            myLabel.frame = CGRect(x: view.layoutMargins.left, y: 0, width: 200, height: 18)
            myLabel.font = UIFontMetrics.default.scaledFont(for: UIFont.customFont.heading!)
            myLabel.adjustsFontForContentSizeCategory = true
            myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            headerView.addSubview(myLabel)
            if section == 4{
                let image = UIImage(named: "chevron")
                button.setImage(image, for: .normal)
                let x = UIScreen.main.bounds.width - self.view.directionalLayoutMargins.leading
                button.frame = CGRect(x: x-12, y: 0, width: 12, height: 18)
                button.addTarget(self, action: #selector(self.action), for: .touchUpInside)
            }
        headerView.addSubview(button)
            return headerView
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.backgroundColor = UIColor.clear
        return footer
    }
    
    @objc func action(button: UIButton){
        let expand = isExpand
        self.isExpand = !expand
        
        var indexPath = [IndexPath]()
        for row in arrTips.indices{
            let index = IndexPath(row: row, section: 4)
            indexPath.append(index)
        }
        if isExpand{
            tableView.insertRows(at: indexPath, with: .fade)
        }else{
            tableView.deleteRows(at: indexPath, with: .fade)
        }
        let image = button.currentImage?.rotate(radians: isExpand ? .pi/2 : 0)
        button.setImage(image, for: .normal)
        
    }

}
extension DetailPageVC{
    func detectTypeImage() {
        guard let model = try? VNCoreMLModel(for: JenisPisang1().model) else {
            fatalError("Failed to load model")
        }
        
        // Create a vision request
        let request = VNCoreMLRequest(model: model) {[weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first
                else {
                    fatalError("Unexpected results")
            }
            
            // Update the Main UI Thread with our result
                print("\(Int(topResult.confidence * 100))% \(topResult.identifier)")
                self?.typeAccuration = "\(Int(topResult.confidence * 100))%"
                self?.typeBanana = "\(topResult.identifier)"
        }
        
        guard let ciImage = CIImage(image: image!)
            else { fatalError("Cant create CIImage from UIImage") }
        
        // Run klasifikasi jenis pisang
        let handler = VNImageRequestHandler(ciImage: ciImage)
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
    }
    
    func detectAgeImage() {
        guard let model = try? VNCoreMLModel(for: UmurPisang1().model) else {
            fatalError("Failed to load model")
        }
        
        // Create a vision request
        let request = VNCoreMLRequest(model: model) {[weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first
                else {
                    fatalError("Unexpected results")
            }
            
            // Update the Main UI Thread with our result
                print("\(Int(topResult.confidence * 100))% \(topResult.identifier)")
                self?.ageAccuration = "\(Int(topResult.confidence * 100))%"
                self?.ageBanana = "\(topResult.identifier)"
        }
        
        guard let ciImage = CIImage(image: image!)
            else { fatalError("Cant create CIImage from UIImage") }
        
        // Run klasifikasi umur pisang
        let handler = VNImageRequestHandler(ciImage: ciImage)
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
    }
    
    func detectRipeImage() {
        guard let model = try? VNCoreMLModel(for: KematanganPisang1().model) else {
            fatalError("Failed to load model")
        }
        
        // Create a vision request
        let request = VNCoreMLRequest(model: model) {[weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first
                else {
                    fatalError("Unexpected results")
            }
            
            // Update the Main UI Thread with our result
                print("\(Int(topResult.confidence * 100))% \(topResult.identifier)")
                self?.ageAccuration = "\(Int(topResult.confidence * 100))%"
                self?.ageBanana = "\(topResult.identifier)"
        }
        
        guard let ciImage = CIImage(image: image!)
            else { fatalError("Cant create CIImage from UIImage") }
        
        // Run klasifikasi kematangan pisang
        let handler = VNImageRequestHandler(ciImage: ciImage)
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
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
