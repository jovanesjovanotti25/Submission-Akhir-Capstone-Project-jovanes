//
//  SplashViewController.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 22/09/22.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.perform(#selector(self.requestMainController), with: nil, afterDelay: 0.5)
    }
    
    @objc func requestMainController() {
        self.navigationController?.pushViewController(ModuleBuilder.getView(module: .main), animated: true)
    }

}
