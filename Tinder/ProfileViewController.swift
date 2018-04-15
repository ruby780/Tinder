//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Ruben A Gonzalez on 4/14/18.
//  Copyright © 2018 Ruben A Gonzalez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    var cardImage : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        cardImageView.image = cardImage
        cardImageView.layer.cornerRadius = 8.0
        cardImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitProfile(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
