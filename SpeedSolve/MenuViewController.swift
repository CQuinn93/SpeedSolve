//
//  SpeedSolveViewController.swift
//  SpeedSolve
//
//  Created by Craig Quinn on 19/01/2023.
//

import UIKit



let defaults = UserDefaults.standard

class MenuViewController: UIViewController, UINavigationControllerDelegate, canRecieve{
    func passDataBack(highScore: Int, currentScore: Int, totalSolved: Int) {
        topScore = highScore
        scoreCurrent = currentScore
        completed = totalSolved
        
        defaults.set(topScore, forKey: highScoreKey)
        defaults.set(scoreCurrent, forKey: currentScoreKey)
        defaults.set(completed, forKey: completedKey)
        
        highScoreLabel.text = "\(topScore)"
        currentStreakLabel.text = "\(scoreCurrent)"
        completedLabel.text = "\(completed)"
    }
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var currentStreakLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Defaults = UserDefaults.standard
        topScore = Defaults.integer(forKey: highScoreKey)
        highScoreLabel.text = "\(topScore)"
        
        scoreCurrent = Defaults.integer(forKey: currentScoreKey)
        currentStreakLabel.text = "\(scoreCurrent)"
        
        completed = Defaults.integer(forKey: completedKey)
        completedLabel.text = "\(completed)"
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playGame"{
            let vc = segue.destination as! SpeedSolveViewController
            vc.highScore = topScore
            vc.currentScore = scoreCurrent
            vc.totalSolved = completed
            vc.delegate = self
        }
    }
    
    let highScoreKey = "highScoreKey"
    var topScore = 0

    let currentScoreKey = "currentScoreKey"
    var scoreCurrent = 0

    let completedKey = "completedKey"
    var completed = 0
}
