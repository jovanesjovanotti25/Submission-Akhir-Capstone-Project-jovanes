//
//  LoadingViewController.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 23/09/22.
//

import UIKit

class LoadingViewController: UIView {
    
    
    @IBOutlet weak var containerIndicator: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        Bundle.main.loadNibNamed("LoadingViewController", owner: self, options: nil)
        addSubview(containerIndicator)
        containerIndicator.frame = self.frame
        containerIndicator.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
