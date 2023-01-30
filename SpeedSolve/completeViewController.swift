//
//  completeViewController.swift
//  SpeedSolve
//
//  Created by Craig Quinn on 23/01/2023.
//

import UIKit

class completeViewController: UIViewController {
    
    
    @IBOutlet weak var S1L1: UIImageView!
    @IBOutlet weak var S1L2: UIImageView!
    @IBOutlet weak var S1L3: UIImageView!
    @IBOutlet weak var S1L4: UIImageView!
    @IBOutlet weak var S1L5: UIImageView!
    
    @IBOutlet weak var G1L1: UIImageView!
    @IBOutlet weak var G1L2: UIImageView!
    @IBOutlet weak var G1L3: UIImageView!
    @IBOutlet weak var G1L4: UIImageView!
    @IBOutlet weak var G1L5: UIImageView!
    
    @IBOutlet weak var G2L1: UIImageView!
    @IBOutlet weak var G2L2: UIImageView!
    @IBOutlet weak var G2L3: UIImageView!
    @IBOutlet weak var G2L4: UIImageView!
    @IBOutlet weak var G2L5: UIImageView!
    
    @IBOutlet weak var G3L1: UIImageView!
    @IBOutlet weak var G3L2: UIImageView!
    @IBOutlet weak var G3L3: UIImageView!
    @IBOutlet weak var G3L4: UIImageView!
    @IBOutlet weak var G3L5: UIImageView!
    
    @IBOutlet weak var G4L1: UIImageView!
    @IBOutlet weak var G4L2: UIImageView!
    @IBOutlet weak var G4L3: UIImageView!
    @IBOutlet weak var G4L4: UIImageView!
    @IBOutlet weak var G4L5: UIImageView!
    
    @IBOutlet weak var G5L1: UIImageView!
    @IBOutlet weak var G5L2: UIImageView!
    @IBOutlet weak var G5L3: UIImageView!
    @IBOutlet weak var G5L4: UIImageView!
    @IBOutlet weak var G5L5: UIImageView!
    
    @IBOutlet weak var G6L1: UIImageView!
    @IBOutlet weak var G6L2: UIImageView!
    @IBOutlet weak var G6L3: UIImageView!
    @IBOutlet weak var G6L4: UIImageView!
    @IBOutlet weak var G6L5: UIImageView!
    
    @IBOutlet weak var triesLabel: UILabel!
    @IBOutlet weak var timeTakenLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var startWord = String()
    var goalWord = String()
    var guessWord1 = [String()]
    var guessWord2 = [String()]
    var guessWord3 = [String()]
    var guessWord4 = [String()]
    var guessWord5 = [String()]
    var guessWord6 = [String()]
    var attemptsTaken = Int()
    var timeTaken = String()
    var Dictionary = Dictionaries()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(updateLabel), with: nil, afterDelay: 7.0)
        defaultmainletters()
        finalStats()
        
        // Do any additional setup after loading the view.
    }
    @objc func updateLabel() {
        self.infoLabel.text = "Swipe down to exit"
        self.infoLabel.textColor = .green
        
    }
    
    func defaultmainletters() {
        S1L1.image = Dictionary.startRoundedLetterDictionary[startWord[0]]
        S1L2.image = Dictionary.startRoundedLetterDictionary[startWord[1]]
        S1L3.image = Dictionary.startRoundedLetterDictionary[startWord[2]]
        S1L4.image = Dictionary.startRoundedLetterDictionary[startWord[3]]
        S1L5.image = Dictionary.startRoundedLetterDictionary[startWord[4]]
    }
    func finalStats() {
        triesLabel.text = String(attemptsTaken)
        timeTakenLabel.text = timeTaken
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
