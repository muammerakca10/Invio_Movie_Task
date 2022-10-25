//
//  LoadingViewController.swift
//  Invio_Movie_World
//
//  Created by Muammer_Akca on 23.10.2022.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet var logoAnimation: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 2, delay: 2, animations: {
            self.logoAnimation.alpha = 0
        }, completion: {_ in
            self.performSegue(withIdentifier: "toHomeVC", sender: nil)
        })
    }
}
