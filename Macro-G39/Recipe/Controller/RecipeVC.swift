//
//  RecipeVC.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 05/10/20.
//

import UIKit

class RecipeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTap(_ sender: Any) {
        performSegue(withIdentifier: "toDetailRecipe", sender: nil)
    }
    
}
