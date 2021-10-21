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
    @IBOutlet weak var lifeLineOne: UIView!
    @IBOutlet weak var lifeLineTwo: UIView!
    @IBOutlet weak var lifeLineThree: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
//        lifeLineOne.backgroundColor = .red
        if isFirstResponder == false {
            lifeLineOne.backgroundColor = .red
        } else if isFirstResponder == false {
            lifeLineTwo.backgroundColor = .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.masksToBounds = false
        startButton.layer.shadowColor = UIColor.red.cgColor
        startButton.layer.shadowOpacity = 100
        startButton.layer.shadowOffset = .zero
        startButton.layer.shadowRadius = 30
        startButton.layer.shouldRasterize = true
        startButton.layer.rasterizationScale = UIScreen.main.scale
        
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
        
        guard self.startButton.layer.shadowColor == UIColor.red.cgColor else { return }
        self.alert()
    }
    
    

    
    
    
    func alert() {
        
        let password = "1234"
        
        let alert = UIAlertController(title: "Enter the password to start the race", message: .none, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input password here..."
        })
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
            
            if alert.textFields?.first?.text == password {
                self.startButton.addShadowsGreen()
            } else {
                self.popUp(context: self, msg: "Wrong Passworn. Try again")
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
        }))
        
        present(alert, animated: true)
    }
    
    func popUp(context ctx: UIViewController, msg: String) {
        
        let toast = UILabel(frame:
                                CGRect(x: 20, y: ctx.view.frame.size.height / 2,
                                       width: ctx.view.frame.size.width - 40, height: 70))
        
        toast.backgroundColor = UIColor.red
        toast.textColor = UIColor.white
        toast.textAlignment = .center;
        toast.numberOfLines = 3
        toast.font = UIFont.systemFont(ofSize: 20)
        toast.layer.cornerRadius = 15;
        toast.clipsToBounds  =  true
        
        toast.text = msg
        
        ctx.view.addSubview(toast)
        
        UIView.animate(withDuration: 5.0, delay: 0.2,
                       options: .curveEaseOut, animations: {
                        toast.alpha = 0.0
                       }, completion: {(isCompleted) in
                        toast.removeFromSuperview()
                       })
    }
}

extension UIButton {
    func addShadowsGreen() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.green.cgColor
        layer.shadowOpacity = 100
        layer.shadowOffset = .zero
        layer.shadowRadius = 30
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addRadius() {
        layer.cornerRadius = frame.height / 2
    }
}
