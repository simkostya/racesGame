//
//  ViewController.swift
//  HW_Kostya_races
//
//  Created by Kostya on 10/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.addShadows()
        startButton.addRadius()
    }
}

extension UIButton {
    func addShadows() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOpacity = 50
        layer.shadowOffset = .zero
        layer.shadowRadius = 50
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addRadius() {
        layer.cornerRadius = frame.height / 2
    }
}
