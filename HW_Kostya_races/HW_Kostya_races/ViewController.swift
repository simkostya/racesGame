//
//  ViewController.swift
//  HW_Kostya_races
//
//  Created by Kostya on 10/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    var menuOut = true
    
    @IBOutlet weak var mainViewOutlet: UIView!
    @IBOutlet weak var menuViewOutlet: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.addShadows()
        startButton.addRadius()
    }
    
    @IBAction func settingsButtonAction(_ sender: UIButton) {
        menuOut = false
        
        if menuOut == false {
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.menuViewOutlet.frame = CGRect(x: 0, y: 0, width: self.menuViewOutlet.frame.width, height: self.menuViewOutlet.frame.height)
            }, completion: nil)
            
            let darkBlur = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: darkBlur)
            blurView.frame = view.frame
            mainViewOutlet.addSubview(blurView)
            
        }
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        menuOut = true
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.menuViewOutlet.frame = CGRect(x: -262, y: 0, width: self.menuViewOutlet.frame.width, height: self.menuViewOutlet.frame.height)
        }, completion: nil)
        
        for subview in mainViewOutlet.subviews {
            if subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
        }
    }
    
    @IBAction func goButtoAction(_ sender: Any) {
        self.alert()
        
        
        
    }
    
    func alert() {
        
        let password = "1234"
        
        let alert = UIAlertController(title: "Enter the password to start the race", message: .none, preferredStyle: .alert)
        //        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        //        blurredView.frame = self.view.bounds
        //        mainViewOutlet.addSubview(blurredView)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input password here..."
        })
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
            //                                        if let name = alert.textFields?.first?.text {
            //                                            print("\(name)")
            //                                        }
            
            if alert.textFields?.first?.text == password {
                //                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                //                let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainRaceViewController") as! MainRaceViewController
                //                newViewController.modalPresentationStyle = .fullScreen
                //                newViewController.mainView = .some(self.mainViewOutlet)
                //                self.present(newViewController, animated: true, completion: nil)
            } else {
                print("1212121")
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
        }))
        
        present(alert, animated: true)
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
