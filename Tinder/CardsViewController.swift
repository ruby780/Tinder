//
//  CardsViewController.swift
//  Tinder
//
//  Created by Ruben A Gonzalez on 4/13/18.
//  Copyright © 2018 Ruben A Gonzalez. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    var fadeTransition: FadeTransition!

    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardImageView.layer.cornerRadius = 8.0
        cardImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanPhoto(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        let location = sender.location(in: view)
        var flipRotation = 1.0;
        
        if sender.state == .began {
            print("Gesture began")
            cardImageView = sender.view as! UIImageView
            cardInitialCenter = cardImageView.center
            
            if location.y > cardInitialCenter.y {
                flipRotation = -1.0
            }
            
        } else if sender.state == .changed {
            print("Gesture is changing")
            if location.y > cardInitialCenter.y {
                flipRotation = -1.0
            } else {
                flipRotation = 1.0
            }
            
            
            if velocity.x > 0  {
                cardImageView.transform = cardImageView.transform.rotated(by: CGFloat((0.2*flipRotation) * Double.pi / 180))
            } else if velocity.x < 0 {
                cardImageView.transform = cardImageView.transform.rotated(by: CGFloat((-0.2*flipRotation) * Double.pi / 180))
            }
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
        } else if sender.state == .ended {
            print("Gesture ended")
            
            if translation.x > 50 {
                UIView.animate(withDuration: 0, animations: {
                    self.cardImageView.center.x += self.view.bounds.width
                    })
            } else if translation.x < -50 {
                UIView.animate(withDuration: 0, animations: {
                    self.cardImageView.center.x -= self.view.bounds.width
                })
            } else {
                cardImageView.center = cardInitialCenter
                cardImageView.transform = CGAffineTransform.identity
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Access the profile view controller and assign the image to that view controllers image variable
        let profileViewController = segue.destination as! ProfileViewController
        profileViewController.cardImage = cardImageView.image
        
        // Set the modal presentation style of your destinationViewController to be custom.
        profileViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        profileViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.5
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
