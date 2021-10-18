//
//  MainRaceViewController.swift
//  HW_Kostya_races
//
//  Created by Kostya on 10/7/21.
//

import UIKit

class MainRaceViewController: UIViewController {
    
    var timerMain: Timer? = nil
    
    let randomNum = CGFloat(Int.random(in: 1..<100))
    let randForDelay = TimeInterval(Int.random(in: 1..<3))
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var pitRight: UIImageView!
    @IBOutlet weak var pitLeft: UIImageView!
    @IBOutlet weak var policeRight: UIImageView!
    @IBOutlet weak var policeLeft: UIImageView!
    @IBOutlet weak var viewBorderRight: UIView!
    @IBOutlet weak var viewBorderLeft: UIView!
    @IBOutlet weak var carOutlet: UIImageView!
    @IBOutlet weak var stripOne: UIView!
    @IBOutlet weak var stripTwo: UIView!
    @IBOutlet weak var stripThree: UIView!
    @IBOutlet weak var stripFour: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstCoordinates()
        stripeAnimations()
        timer()
        animationsForCrash()
    }
    
    // MARK: - Moving the car
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
            return
        }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: carOutlet.center.y)
        
        sender.setTranslation(.zero, in: view)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Animation of stripes
    
    func stripeAnimations() {
        UIView.animate(withDuration: 4, delay: 0, options: [.repeat], animations: {
            self.stripOne.center = CGPoint(x: self.stripOne.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 4, delay: 1.0, options: [.repeat], animations: {
            self.stripTwo.center = CGPoint(x: self.stripTwo.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 4, delay: 2.0, options: [.repeat], animations: {
            self.stripThree.center = CGPoint(x: self.stripThree.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 4, delay: 3.0, options: [.repeat], animations: {
            self.stripFour.center = CGPoint(x: self.stripFour.center.x, y: 1200)
        }, completion: nil)
    }
    
    // MARK: - Crash check
    
    func animationsForCrash() {
        UIView.animate(withDuration: 5, delay: 3 + randForDelay, options: [.repeat], animations: {
            self.policeLeft.center = CGPoint(x: self.policeLeft.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 5, delay: 2 + randForDelay, options: [.repeat], animations: {
            self.policeRight.center = CGPoint(x: self.policeRight.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 4, delay: 1 + randForDelay, options: [.repeat], animations: {
            self.pitLeft.center = CGPoint(x: self.pitLeft.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 4, delay: 4 + randForDelay, options: [.repeat], animations: {
            self.pitRight.center = CGPoint(x: self.pitRight.center.x, y: 1200)
        }, completion: nil)
    }
    
    // MARK: - Timer for checking crashes and alert

    func timer() {
        timerMain = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            if  self.carOutlet.frame.intersects(self.viewBorderLeft.frame) == true || self.carOutlet.frame.intersects(self.viewBorderRight.frame) == true || self.pitRight.layer.presentation()?.frame.intersects(self.carOutlet.frame) == true || self.pitLeft.layer.presentation()?.frame.intersects(self.carOutlet.frame) == true ||
                self.policeLeft.layer.presentation()?.frame.intersects(self.carOutlet.frame) == true ||
                self.policeRight.layer.presentation()?.frame.intersects(self.carOutlet.frame) == true {
                self.alert()
                self.timerMain?.invalidate()
                
                UIView.animate(withDuration: 2) {
                    self.carOutlet.transform = CGAffineTransform(rotationAngle: (CGFloat(Double.pi - Double(Int.random(in: 1..<50)))))
                }
            }
        }
        
        timerMain?.fire()
    }
    
    func alert() {
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurredView.frame = self.view.bounds
        mainView.addSubview(blurredView)
        
        let alertController = UIAlertController(title: " CRASH ", message: "try again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Go back", style: .default) { (_) in
//            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Initial coordinates of the bands
    
    func firstCoordinates() {
        stripOne.center = CGPoint(x: stripOne.center.x, y: -200)
        stripTwo.center = CGPoint(x: stripTwo.center.x, y: -200)
        stripThree.center = CGPoint(x: stripThree.center.x, y: -200)
        stripFour.center = CGPoint(x: stripFour.center.x, y: -200)
        
        pitLeft.center = CGPoint(x: pitLeft.center.x + randomNum, y: -100 + randomNum)
        pitRight.center = CGPoint(x: pitRight.center.x - randomNum, y: -200 - randomNum)
        
        policeLeft.center = CGPoint(x: policeLeft.center.x + randomNum, y: -300 + randomNum)
        policeRight.center = CGPoint(x: policeRight.center.x - randomNum, y: -400 - randomNum)
    }
}
