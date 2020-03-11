//
//  QuizCategoryListViewController.swift
//  BoyGirl
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class QuizCategoryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // the quiz fetcher
    private let quizCategoriesFetcher: QuizCategoriesFetcher = QuizCategoriesFetcher()
    
    // to store the fetched categories
    private var quizCategories: [Category] = []
    
    // to store the user selected category to display
    var chosenCategory = ""
    
    // a loading spinner view
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    // to display a list of categories
    @IBOutlet private weak var tableView: UITableView!

    // setup the page when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        setupTableView()
        
        // trigger the quizCategoriesFetcher to make a network call
        fetchQuizCategories()

        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.tableView.backgroundColor = nil
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "QuizCategoryListTableViewCell", bundle: nil), forCellReuseIdentifier: "QuizCategoryListTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func fetchQuizCategories() {
        activityIndicatorView.isHidden = false
        
        quizCategoriesFetcher.fetchQuizCategories { (result) in
            
            // update the view on the main thread once the fetcher finishes loading
            DispatchQueue.main.async {
                
                // hide the loading spinner
                self.activityIndicatorView.isHidden = true
                
                switch result {
                    
                // display the quiz categories when successfully loaded
                case .success(let categories):
                    self.quizCategories = categories
                    self.tableView.reloadData()
                    
                case .fail(_):
                    break
                }
            }
        }
    }
    
    // tell the table view how many categories to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizCategories.count
    }
    
    // customise the cell in the "indexPath" position
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCategoryListTableViewCell", for: indexPath) as! QuizCategoryListTableViewCell
        let category = quizCategories[indexPath.row]
        cell.setup(category: category)
        return cell
    }
    
    // set the selected category on user tap and trigger a storyboard segue
    // and note which one is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = quizCategories[indexPath.row]
        chosenCategory = String(category.title)
        print(chosenCategory)
        performSegue(withIdentifier: "PresentCategory", sender: self)
    }
    //sends the category over to pair with random letter
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentCategory" {
            let destinationVC = segue.destination as! RandomLetterViewController
            destinationVC.currentCategory = chosenCategory
        }
    }
}
//lets build that app search on youtube

