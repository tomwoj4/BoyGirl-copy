//
//  RandomLetterViewController.swift
//  Boygirl
//
//  Created by Tom Wojcik on 11/02/2020.
//  Copyright © 2020 Tom Wojcik. All rights reserved.
//

import UIKit

class RandomLetterViewController: UIViewController {
    
    var chosenLetter = "A"
    var currentCategory: String?
    
    @IBOutlet weak var randomLetter: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        self.title = currentCategory
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    @IBAction func shuffleLetters(_ sender: UIButton) {
        randomString(length: 1)
        print(chosenLetter)
        print(currentCategory!)
    }
    
    func randomString(length: Int) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        chosenLetter = String((0..<length).map{ _ in letters.randomElement()! })
        randomLetter.text = chosenLetter

        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            randomString(length: 1)
            print(chosenLetter)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "beginQuiz" {
            let destinationVC = segue.destination as! QuizListViewController

            destinationVC.currentCategory = currentCategory!
            destinationVC.currentLetter = chosenLetter

        }
    }
}
