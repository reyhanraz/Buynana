//
//  ViewController.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 05/10/20.
//

import UIKit

class CameraVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)        
    }
    @IBAction func toDetail(_ sender: Any){
        performSegue(withIdentifier: "toDetailPage", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPageVC{
            destination.delegate = self
        }
    }


}

extension CameraVC: ModalHandler{
    func modalDismissed() {
        let storyB = UIStoryboard(name: "RecipeSB", bundle: nil)
        let vc = storyB.instantiateViewController(withIdentifier: "RecipeVC") as! RecipeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

protocol ModalHandler: AnyObject {
    func modalDismissed()
}
