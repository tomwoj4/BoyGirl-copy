//
//  OnboardingStart.swift
//  Boygirl
//
//  Created by Tom Wojcik on 15/02/2020.
//  Copyright © 2020 Tom Wojcik. All rights reserved.
//

import UIKit

class OnboardingStart: UIViewController {
    
    //background
    let backgroundImage: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "background.png")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        return image
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.insertSubview(backgroundImage, at: 0)

    }
    

}
