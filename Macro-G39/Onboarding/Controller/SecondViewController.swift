//
//  SecondViewController.swift
//  Onboarding
//
//  Created by Dwi Rendrahadi on 05/11/20.
//  Copyright © 2020 Dwi Rendrahadi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mulaiButton: UIButton!
    @IBOutlet var onboarding2View: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonMulai()
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(_:)))
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
   }
    @objc func swipeHandler(_ sender: UISwipeGestureRecognizer){
           if sender.direction == .right{
            self.navigationController?.popViewController(animated: true)
           }
       }
    func buttonMulai(){
        mulaiButton.layer.cornerRadius = 25
        mulaiButton.layer.shadowOpacity = 1
        mulaiButton.layer.shadowOffset = CGSize (width: 0, height: 4)
        mulaiButton.layer.shadowColor = #colorLiteral(red: 0.8231846094, green: 0.6724917293, blue: 0.2936917841, alpha: 1)
        mulaiButton.layer.shadowRadius = 0.5
    }

    @IBAction func mulaiButtonTapped(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers ;
        for aViewController in viewControllers {
            if(aViewController is HomeVC){
               self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
    }
}

