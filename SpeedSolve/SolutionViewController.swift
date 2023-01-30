//
//  SolutionViewController.swift
//  SpeedSolve
//
//  Created by Craig Quinn on 22/01/2023.
//

import UIKit

class SolutionViewController: UIViewController {
    
    @IBOutlet weak var S1L1: UIImageView!
    @IBOutlet weak var S1L2: UIImageView!
    @IBOutlet weak var S1L3: UIImageView!
    @IBOutlet weak var S1L4: UIImageView!
    @IBOutlet weak var S1L5: UIImageView!
    
    @IBOutlet weak var S2L1: UIImageView!
    @IBOutlet weak var S2L2: UIImageView!
    @IBOutlet weak var S2L3: UIImageView!
    @IBOutlet weak var S2L4: UIImageView!
    @IBOutlet weak var S2L5: UIImageView!
    
    @IBOutlet weak var S3L1: UIImageView!
    @IBOutlet weak var S3L2: UIImageView!
    @IBOutlet weak var S3L3: UIImageView!
    @IBOutlet weak var S3L4: UIImageView!
    @IBOutlet weak var S3L5: UIImageView!
    
    @IBOutlet weak var S4L1: UIImageView!
    @IBOutlet weak var S4L2: UIImageView!
    @IBOutlet weak var S4L3: UIImageView!
    @IBOutlet weak var S4L4: UIImageView!
    @IBOutlet weak var S4L5: UIImageView!
    
    @IBOutlet weak var S5L1: UIImageView!
    @IBOutlet weak var S5L2: UIImageView!
    @IBOutlet weak var S5L3: UIImageView!
    @IBOutlet weak var S5L4: UIImageView!
    @IBOutlet weak var S5L5: UIImageView!
    
    @IBOutlet weak var S6L1: UIImageView!
    @IBOutlet weak var S6L2: UIImageView!
    @IBOutlet weak var S6L3: UIImageView!
    @IBOutlet weak var S6L4: UIImageView!
    @IBOutlet weak var S6L5: UIImageView!
    
    @IBOutlet weak var S7L1: UIImageView!
    @IBOutlet weak var S7L2: UIImageView!
    @IBOutlet weak var S7L3: UIImageView!
    @IBOutlet weak var S7L4: UIImageView!
    @IBOutlet weak var S7L5: UIImageView!
    
    
    let dict = Dictionaries()
    var startingWord = String()
    var solutionword1 = String()
    var solutionword2 = String()
    var solutionword3 = String()
    var solutionword4 = String()
    var solutionword5 = String()
    var finalWord = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        S1L1.image = dict.startRoundedLetterDictionary[startingWord[0]]
        S1L2.image = dict.startRoundedLetterDictionary[startingWord[1]]
        S1L3.image = dict.startRoundedLetterDictionary[startingWord[2]]
        S1L4.image = dict.startRoundedLetterDictionary[startingWord[3]]
        S1L5.image = dict.startRoundedLetterDictionary[startingWord[4]]
        
        S2L1.image = dict.guessRoundedLetterDictionary[solutionword1[0]]
        S2L2.image = dict.guessRoundedLetterDictionary[solutionword1[1]]
        S2L3.image = dict.guessRoundedLetterDictionary[solutionword1[2]]
        S2L4.image = dict.guessRoundedLetterDictionary[solutionword1[3]]
        S2L5.image = dict.guessRoundedLetterDictionary[solutionword1[4]]
        
        S3L1.image = dict.guessRoundedLetterDictionary[solutionword2[0]]
        S3L2.image = dict.guessRoundedLetterDictionary[solutionword2[1]]
        S3L3.image = dict.guessRoundedLetterDictionary[solutionword2[2]]
        S3L4.image = dict.guessRoundedLetterDictionary[solutionword2[3]]
        S3L5.image = dict.guessRoundedLetterDictionary[solutionword2[4]]
        
        S4L1.image = dict.guessRoundedLetterDictionary[solutionword3[0]]
        S4L2.image = dict.guessRoundedLetterDictionary[solutionword3[1]]
        S4L3.image = dict.guessRoundedLetterDictionary[solutionword3[2]]
        S4L4.image = dict.guessRoundedLetterDictionary[solutionword3[3]]
        S4L5.image = dict.guessRoundedLetterDictionary[solutionword3[4]]
        
        S5L1.image = dict.guessRoundedLetterDictionary[solutionword4[0]]
        S5L2.image = dict.guessRoundedLetterDictionary[solutionword4[1]]
        S5L3.image = dict.guessRoundedLetterDictionary[solutionword4[2]]
        S5L4.image = dict.guessRoundedLetterDictionary[solutionword4[3]]
        S5L5.image = dict.guessRoundedLetterDictionary[solutionword4[4]]
        
        S6L1.image = dict.guessRoundedLetterDictionary[solutionword5[0]]
        S6L2.image = dict.guessRoundedLetterDictionary[solutionword5[1]]
        S6L3.image = dict.guessRoundedLetterDictionary[solutionword5[2]]
        S6L4.image = dict.guessRoundedLetterDictionary[solutionword5[3]]
        S6L5.image = dict.guessRoundedLetterDictionary[solutionword5[4]]
        
        S7L1.image = dict.goalRoundedLetterDictionary[finalWord[0]]
        S7L2.image = dict.goalRoundedLetterDictionary[finalWord[1]]
        S7L3.image = dict.goalRoundedLetterDictionary[finalWord[2]]
        S7L4.image = dict.goalRoundedLetterDictionary[finalWord[3]]
        S7L5.image = dict.goalRoundedLetterDictionary[finalWord[4]]
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
