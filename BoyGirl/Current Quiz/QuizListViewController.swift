//
//  QuizListViewController.swift
//  BoyGirl
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class QuizListViewController: UIViewController, UITextFieldDelegate {
    
    var counter = 59
    var nameEntered: [String] = []
    var nameStorage: [String] = []
    var totalCorrect = 0
    var currentLetter = ""
    var currentCategory = ""
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var currentQuizInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInput.delegate = self
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        getNames()
        currentQuizInfo.text = "Enter '\(currentCategory)' names starting with '\(currentLetter)'"
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    //fetch names
    func getNames() {
        do {
            let path: String = Bundle.main.path(forResource: "\(currentCategory)", ofType: "txt")!
            let file = try String(contentsOfFile: path)
            let text: [String] = file.components(separatedBy: .newlines)
            nameStorage = text.filter({ $0.hasPrefix(currentLetter)})
            print(nameStorage)
        } catch let error {
            Swift.print("Fatal Error: \(error.localizedDescription)")
        }
    }
    
    @IBAction func nameButton(_ sender: UIButton) {
            nameEntered += [nameInput.text ?? ""]
            print(nameEntered)
//            nameInput.endEditing(true)
            nameInput.text = ""
            print(currentLetter)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        nameInput.endEditing(true)
        nameEntered += [nameInput.text ?? ""]
        nameInput.text = ""
        return true
    }
    
    @objc func updateCounter() {
        if counter > 0 {
            timerLabel.text = "\(String(counter))s"
            counter -= 1
        } else if counter < 1 {
            self.title = "Times up!"
            nameInput.isUserInteractionEnabled = false
            nameInput.self.text = "TIMES UP"
            Timer().invalidate()
        }
    }
    
    @IBAction func endQuizButton(_ sender: UIButton) {
        let arrayOfMatches = nameEntered.filter { nameStorage.contains($0)}
        print(arrayOfMatches)
        totalCorrect = arrayOfMatches.count
        print(totalCorrect)
    }
    
    //sends over the score
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showScore" {
            let destinationVC = segue.destination as! ScoreViewController
            destinationVC.score = totalCorrect
        }
    }
}
