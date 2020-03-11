//
//  OnboardingProgramatic.swift
//  Boygirl
//
//  Created by Tom Wojcik on 12/02/2020.
//  Copyright © 2020 Tom Wojcik. All rights reserved.
//
import UIKit

class OnboardingProgramatic: UIViewController {
    
    //background
    let backgroundImage: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "background.png")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        return image
    }()
    
    //pencil imageview
    let pencilImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "pencil-first"))
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
        Enjoy a game with friends, or practice against the computer.
        The more unique your answer the more points you get!
        """
        label.numberOfLines = 4
        label.textColor = UIColor(red: 0.0627, green: 0.0549, blue: 0.2, alpha: 1.0)
        label.font = UIFont(name: "Futura", size: 23)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pencilImageView)
        view.addSubview(startingText)
        view.insertSubview(backgroundImage, at: 0)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        //pencilsize
        pencilImageView.widthAnchor.constraint(equalToConstant: 282).isActive = true
        pencilImageView.heightAnchor.constraint(equalToConstant: 287).isActive = true
        
        //pencil position
        pencilImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 173.2).isActive = true
        pencilImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150.7).isActive = true
        pencilImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        //starting text size
        startingText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startingText.heightAnchor.constraint(equalToConstant: 137).isActive = true
        
        //starting test position
        startingText.topAnchor.constraint(equalTo: pencilImageView.bottomAnchor, constant: 129.4).isActive = true
        startingText.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        startingText.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}
