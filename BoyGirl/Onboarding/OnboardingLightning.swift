//
//  OnboardingLightning.swift
//  Boygirl
//
//  Created by Tom Wojcik on 15/02/2020.
//  Copyright © 2020 Tom Wojcik. All rights reserved.
//

import UIKit

class OnboardingLightning: UIViewController {

    //background
    let backgroundImage: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "background.png")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        return image
    }()
    
    //pencil imageview
    let lightningImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Group 1099"))
        //this enables autolayout for imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //starting text label
    let startingText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = """
        liquam elementum eget mi eget ullamcorper.
        In pretium leo vel lacus viverra, vel varius nulla finibus.
        """
        label.numberOfLines = 4
        label.textColor = UIColor(red: 0.0627, green: 0.0549, blue: 0.2, alpha: 1.0)
        label.font = UIFont(name: "Futura", size: 23)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lightningImageView)
        view.addSubview(startingText)
        view.insertSubview(backgroundImage, at: 0)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        //lightningsize
        lightningImageView.widthAnchor.constraint(equalToConstant: 304.2).isActive = true
        lightningImageView.heightAnchor.constraint(equalToConstant: 329.7).isActive = true

        //lightning position
        lightningImageView.topAnchor.constraint(equalTo: startingText.bottomAnchor, constant: 62).isActive = true
        lightningImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -70).isActive = true
//        lightningImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 70.8).isActive = true

        //starting text label size
        startingText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startingText.heightAnchor.constraint(equalToConstant: 137).isActive = true
        
        //starting test position
        startingText.topAnchor.constraint(equalTo: view.topAnchor, constant: 117).isActive = true
        startingText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 37).isActive = true
        startingText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}
