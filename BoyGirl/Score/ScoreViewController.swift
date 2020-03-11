//
//  ScorePageViewController.swift
//  Boygirl
//
//  Created by Tom Wojcik on 10/02/2020.
//  Copyright © 2020 Tom Wojcik. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = String(score)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}
