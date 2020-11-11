//
//  ViewController.swift
//  Onboarding
//
//  Created by Dwi Rendrahadi on 28/10/20.
//  Copyright © 2020 Dwi Rendrahadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var lanjutButton: UIButton!
    @IBOutlet var onboardingView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLanjut()
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(_:)))
        swipe.direction = .left
        
        self.view.addGestureRecognizer(swipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.navigationBar.isHidden = true
    }
    @objc func swipeHandler(_ sender: UISwipeGestureRecognizer){
        if sender.direction == .left{
            let vc = UIStoryboard(name: "OnboardingSB", bundle:nil)
            let v2 = vc.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            self.navigationController?.pushViewController(v2, animated: true)
        }
    }
    func buttonLanjut(){
        lanjutButton.layer.cornerRadius = 25
        lanjutButton.layer.shadowOpacity = 1
        lanjutButton.layer.shadowOffset = CGSize (width: 0, height: 4)
        lanjutButton.layer.shadowColor = #colorLiteral(red: 0.8231846094, green: 0.6724917293, blue: 0.2936917841, alpha: 1)
        lanjutButton.layer.shadowRadius = 0.5
    }
    @IBAction func skipButtonTapped(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers ;
        for aViewController in viewControllers {
            if(aViewController is HomeVC){
               self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
    }
}
