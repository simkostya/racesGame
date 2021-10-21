//
//  SettingsViewController.swift
//  HW_Kostya_races
//
//  Created by Kostya on 10/21/21.
//

import UIKit

class SettingsViewController: UIViewController {
    static var carImageNumber = 0
    static var obsImageNumber = 0
    
    var carImages = [UIImage]()
    var obstacleImages = [UIImage]()
    
    @IBOutlet weak var carSelectOutlet: UIImageView!
    @IBOutlet weak var obstacleSelectOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carImages.append(UIImage(named: "carOne")!)
        carImages.append(UIImage(named: "carTwo")!)
        carImages.append(UIImage(named: "carThree")!)
        
        obstacleImages.append(UIImage(named: "rock")!)
        obstacleImages.append(UIImage(named: "pitTwo")!)
        
        
        carSelectOutlet.image = carImages[0]
        obstacleSelectOutlet.image = obstacleImages[0]
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToRootButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func carSelectLeftButton(_ sender: UIButton) {
        if carSelectOutlet.image == carImages[0] {
            carSelectOutlet.image = carImages[1]
            SettingsViewController.carImageNumber = 1
        } else if carSelectOutlet.image == carImages[1] {
            carSelectOutlet.image = carImages[2]
            SettingsViewController.carImageNumber = 2
        } else if carSelectOutlet.image == carImages[2] {
            carSelectOutlet.image = carImages[0]
            SettingsViewController.carImageNumber = 0
        }
    }
    
    @IBAction func carSelectRightButton(_ sender: UIButton) {
        if carSelectOutlet.image == carImages[0] {
            carSelectOutlet.image = carImages[2]
            SettingsViewController.carImageNumber = 2
        } else if carSelectOutlet.image == carImages[2] {
            carSelectOutlet.image = carImages[1]
            SettingsViewController.carImageNumber = 1
        } else if carSelectOutlet.image == carImages[1] {
            carSelectOutlet.image = carImages[0]
            SettingsViewController.carImageNumber = 0
        }
    }
    
    @IBAction func obstacleSelectLeftButton(_ sender: UIButton) {
        if obstacleSelectOutlet.image == obstacleImages[0] {
            obstacleSelectOutlet.image = obstacleImages[1]
            SettingsViewController.obsImageNumber = 1
        } else if obstacleSelectOutlet.image == obstacleImages[1] {
            obstacleSelectOutlet.image = obstacleImages[0]
            SettingsViewController.obsImageNumber = 0
        }
    }
    
    @IBAction func obstacleSelectRightButton(_ sender: UIButton) {
        if obstacleSelectOutlet.image == obstacleImages[1] {
            obstacleSelectOutlet.image = obstacleImages[0]
            SettingsViewController.obsImageNumber = 0
        } else if obstacleSelectOutlet.image == obstacleImages[0] {
            obstacleSelectOutlet.image = obstacleImages[1]
            SettingsViewController.obsImageNumber = 1
        }
    }
}
