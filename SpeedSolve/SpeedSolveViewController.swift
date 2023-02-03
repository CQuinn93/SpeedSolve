//
//  ViewController.swift
//  SpeedSolve
//
//  Created by Craig Quinn on 03/02/2022.
//

import UIKit

protocol canRecieve {
    
    func passDataBack(highScore: Int, currentScore: Int, totalSolved: Int)
}

class SpeedSolveViewController: UIViewController {
    
    @IBOutlet weak var startUpButton: UIButton!
    @IBOutlet weak var startCounter: UILabel!
    
    @IBOutlet weak var mainLetter1: UIImageView!
    @IBOutlet weak var mainLetter2: UIImageView!
    @IBOutlet weak var mainLetter3: UIImageView!
    @IBOutlet weak var mainLetter4: UIImageView!
    @IBOutlet weak var mainLetter5: UIImageView!
    
    @IBOutlet weak var A1L1: UIImageView!
    @IBOutlet weak var A1L2: UIImageView!
    @IBOutlet weak var A1L3: UIImageView!
    @IBOutlet weak var A1L4: UIImageView!
    @IBOutlet weak var A1L5: UIImageView!
    
    @IBOutlet weak var A2L1: UIImageView!
    @IBOutlet weak var A2L2: UIImageView!
    @IBOutlet weak var A2L3: UIImageView!
    @IBOutlet weak var A2L4: UIImageView!
    @IBOutlet weak var A2L5: UIImageView!
    
    @IBOutlet weak var A3L1: UIImageView!
    @IBOutlet weak var A3L2: UIImageView!
    @IBOutlet weak var A3L3: UIImageView!
    @IBOutlet weak var A3L4: UIImageView!
    @IBOutlet weak var A3L5: UIImageView!
    
    @IBOutlet weak var A4L1: UIImageView!
    @IBOutlet weak var A4L2: UIImageView!
    @IBOutlet weak var A4L3: UIImageView!
    @IBOutlet weak var A4L4: UIImageView!
    @IBOutlet weak var A4L5: UIImageView!
    
    @IBOutlet weak var A5L1: UIImageView!
    @IBOutlet weak var A5L2: UIImageView!
    @IBOutlet weak var A5L3: UIImageView!
    @IBOutlet weak var A5L4: UIImageView!
    @IBOutlet weak var A5L5: UIImageView!
    
    @IBOutlet weak var A6L1: UIImageView!
    @IBOutlet weak var A6L2: UIImageView!
    @IBOutlet weak var A6L3: UIImageView!
    @IBOutlet weak var A6L4: UIImageView!
    @IBOutlet weak var A6L5: UIImageView!
    
    @IBOutlet weak var goalLetter1: UIImageView!
    @IBOutlet weak var goalLetter2: UIImageView!
    @IBOutlet weak var goalLetter3: UIImageView!
    @IBOutlet weak var goalLetter4: UIImageView!
    @IBOutlet weak var goalLetter5: UIImageView!
    
    @IBOutlet weak var readyLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var onboardImage: UIImageView!
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var solutionButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var Q: UIButton!
    @IBOutlet weak var W: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var R: UIButton!
    @IBOutlet weak var T: UIButton!
    @IBOutlet weak var Y: UIButton!
    @IBOutlet weak var U: UIButton!
    @IBOutlet weak var I: UIButton!
    @IBOutlet weak var O: UIButton!
    @IBOutlet weak var P: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var S: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var H: UIButton!
    @IBOutlet weak var J: UIButton!
    @IBOutlet weak var K: UIButton!
    @IBOutlet weak var L: UIButton!
    @IBOutlet weak var Z: UIButton!
    @IBOutlet weak var X: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var V: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var N: UIButton!
    @IBOutlet weak var M: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var Enter: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!

    // ----------------------------- Variables for View controller ---------------------------------
    var Dictionary = Dictionaries()
    var Assigner = Assignment()
    var tries = 0
    
    //    Settng up the timers
    //    These variables will be used at the start to count the user in before it starts
    var startInt = 3
    var startTimer = Timer()
    
    //    These variables will be used while your are trying to complete the word. 3 minutes (180 seconds) will be on the timer
    var gameInt = 180
    var gameTimer = Timer()
    
    var timeTakenInt = 0
    var timeTakenTimer = Timer()
    var finalTime = String()
    
    var highScore = 0
    var currentScore = 0
    var totalSolved = 0
    
    var delegate: canRecieve?
    var defaults = UserDefaults.standard
    
    // ----------------------------- Application Launch ---------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableAllbuttons()
        Assigner.GenerateAnswerAndGoal()
        defaultGoalLetters()
        errorLabel.alpha = 0
        defaultmainletters()
        setAlpha(Tries: tries)
        startCounter.alpha = 0
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func back(sender: Any?) {
        delegate!.passDataBack(highScore: highScore, currentScore: currentScore, totalSolved: totalSolved )
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.identifier == "solution" {
            let vc = segue.destination as! SolutionViewController
            vc.startingWord = Assigner.startingWord
            vc.solutionword1 = Assigner.solutionword1
            vc.solutionword2 = Assigner.solutionword2
            vc.solutionword3 = Assigner.solutionword3
            vc.solutionword4 = Assigner.solutionword4
            vc.solutionword5 = Assigner.solutionword5
            vc.finalWord = Assigner.goalWord
        }
        else if segue.identifier == "howToPlay" {
        
        }
        else if segue.identifier == "complete" {
            let vc = segue.destination as! completeViewController
            vc.startWord = Assigner.startingWord
            vc.guessWord1 = Assigner.attempt1Letters
            vc.guessWord2 = Assigner.attempt2Letters
            vc.guessWord3 = Assigner.attempt3Letters
            vc.guessWord4 = Assigner.attempt4Letters
            vc.guessWord5 = Assigner.attempt5Letters
            vc.guessWord6 = Assigner.attempt6Letters
            vc.attemptsTaken = tries
            vc.timeTaken = finalTime
            vc.goalWord = Assigner.goalWord
        }
        else{}
    }
    // ----------------------------- All Buttons on UI ---------------------------------
    
    @IBAction func solutionButton(_ sender: UIButton) {
        
        startTimer.invalidate()
        gameTimer.invalidate()
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        enableAllbuttons()
        gameRestart()
    }
    
    @IBAction func startUpButton(_ sender: UIButton) {
        if errorLabel.text == "Completed!" {
            gameRestart()
        }else{
            startTimer.invalidate()
            gameTimer.invalidate()
            startup()}
    }

    @IBAction func Q(_ sender: UIButton) {
        let currentLetter = "Q"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        errorLabel.alpha = 0
        printingLetters()
    }
    @IBAction func W(_ sender: UIButton) {
        let currentLetter = "W"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        errorLabel.alpha = 0
        printingLetters()
    }
    @IBAction func E(_ sender: UIButton) {
        let currentLetter = "E"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        errorLabel.alpha = 0
        printingLetters()
    }
    @IBAction func R(_ sender: UIButton) {
        let currentLetter = "R"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        errorLabel.alpha = 0
        printingLetters()
    }
    @IBAction func T(_ sender: UIButton) {
        let currentLetter = "T"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        errorLabel.alpha = 0
        printingLetters()
    }
    @IBAction func Y(_ sender: UIButton) {
        let currentLetter = "Y"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func U(_ sender: UIButton) {
        let currentLetter = "U"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func I(_ sender: UIButton) {
        let currentLetter = "I"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func O(_ sender: UIButton) {
        let currentLetter = "O"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func P(_ sender: UIButton) {
        let currentLetter = "P"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func A(_ sender: UIButton) {
        let currentLetter = "A"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func S(_ sender: UIButton) {
        let currentLetter = "S"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func D(_ sender: UIButton) {
        let currentLetter = "D"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func F(_ sender: UIButton) {
        let currentLetter = "F"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func G(_ sender: UIButton) {
        let currentLetter = "G"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func H(_ sender: UIButton) {
        let currentLetter = "H"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func J(_ sender: UIButton) {
        let currentLetter = "J"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func K(_ sender: UIButton) {
        let currentLetter = "K"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func L(_ sender: UIButton) {
        let currentLetter = "L"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func Z(_ sender: UIButton) {
        let currentLetter = "Z"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func X(_ sender: UIButton) {
        let currentLetter = "X"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func C(_ sender: UIButton) {
        let currentLetter = "C"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func V(_ sender: UIButton) {
        let currentLetter = "V"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func B(_ sender: UIButton) {
        let currentLetter = "B"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func N(_ sender: UIButton) {
        let currentLetter = "N"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func M(_ sender: UIButton) {
        let currentLetter = "M"
        let currentImage = Dictionary.guessRoundedLetterDictionary[currentLetter]
        Assigner.assignLetterstoArrays(Letter: currentLetter, Image: currentImage!, Tries: tries)
        printingLetters()
    }
    @IBAction func DEL(_ sender: UIButton) {
        let Tries = tries
        errorLabel.alpha = 0
        Assigner.deleteLetters(Tries: Tries)
        printingLetters()
    }
    @IBAction func ENTER(_ sender: UIButton) {
        
        if Assigner.invalidword(Tries: tries){
            errorLabel.alpha = 1
            errorLabel.text = "Please enter a Vaild Word"
        }
        else {Assigner.lastWord(Tries: tries)
            Assigner.yourNextWord(Tries: tries)
            if Assigner.wordIsValid(){
                if Assigner.wordisaccepted(){
                    correctLetters(Tries:tries)
                    if Assigner.checker(){
                        performSegue(withIdentifier: "complete", sender: self)
                        errorLabel.alpha = 1
                        errorLabel.text = "Completed!"
                        errorLabel.textColor = .green
                        readyLabel.alpha = 1
                        readyLabel.text = "Well Done"
                        onboardImage.alpha = 1
                        gameTimer.invalidate()
                        startTimer.invalidate()
                        timeTakenTimer.invalidate()
                        startUpButton.isEnabled = true
                        startUpButton.alpha = 1
                        countdownLabel.text = "00:03:00"
                        currentScore += 1
                        totalSolved += 1
                        if currentScore > highScore {
                            highScore = currentScore
                        }
                    }else{
                        tries = tries + 1
                        print(tries)
                        setAlpha(Tries: tries)
                    }
                } else{
                    errorLabel.alpha = 1
                    errorLabel.text = " Remember to only change 1 letter"}
            }else{
                errorLabel.alpha = 1
                errorLabel.text = " Word Not in Game Dictionary"
            }
            if tries == 6{
                readyLabel.alpha = 1
                readyLabel.text = " Unlucky, Try again"
                restartButton.isEnabled = true
                restartButton.alpha = 1
                solutionButton.isEnabled = true
                solutionButton.alpha = 1
                onboardImage.alpha = 1
                disableAllbuttons()
                currentScore = 0
                
            }
        }
    }
    
    // ----------------------------- All Functions ---------------------------------
    

    
    func startup() {
        startUpButton.isEnabled = false
        startCounter.alpha = 1
        startUpButton.alpha = 0
        readyLabel.alpha = 0
        onboardImage.alpha = 0
        infoLabel.alpha = 0
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SpeedSolveViewController.startTimeReduce)), userInfo: nil, repeats: true)
        
    }
    
    @objc func startTimeReduce() {
        startInt -= 1
        startCounter.text = String(startInt)
        switch startInt {
        case 4:
            goalLetter1.alpha = 1
        case 3:
            goalLetter2.alpha = 1
        case 2:
            goalLetter3.alpha = 1
        case 1:
            goalLetter4.alpha = 1
        case 0:
            goalLetter5.alpha = 1
            startCounter.text = "GO!"
            enableAllbuttons()
        case -1:
            startInt = 5
            startCounter.text = String(startInt)
            startTimer.invalidate()
            startCounter.alpha = 0
            onboardImage.alpha = 0
            runTimer()
            startCounting()
        default:
            startCounter.alpha = 1
        }
    }
    
    func disableAllbuttons() {
        Q.isEnabled = false; W.isEnabled = false; E.isEnabled = false; R.isEnabled = false; T.isEnabled = false; Y.isEnabled = false
        U.isEnabled = false; I.isEnabled = false; O.isEnabled = false; P.isEnabled = false; A.isEnabled = false; S.isEnabled = false
        D.isEnabled = false; F.isEnabled = false; G.isEnabled = false; H.isEnabled = false; J.isEnabled = false; K.isEnabled = false
        L.isEnabled = false; Z.isEnabled = false; X.isEnabled = false; C.isEnabled = false; V.isEnabled = false; B.isEnabled = false
        N.isEnabled = false; M.isEnabled = false; Back.isEnabled = false; Enter.isEnabled = false
    }
    
    func enableAllbuttons() {
        Q.isEnabled = true; W.isEnabled = true; E.isEnabled = true; R.isEnabled = true; T.isEnabled = true; Y.isEnabled = true
        U.isEnabled = true; I.isEnabled = true; O.isEnabled = true; P.isEnabled = true; A.isEnabled = true; S.isEnabled = true
        D.isEnabled = true; F.isEnabled = true; G.isEnabled = true; H.isEnabled = true; J.isEnabled = true; K.isEnabled = true
        L.isEnabled = true; Z.isEnabled = true; X.isEnabled = true; C.isEnabled = true; V.isEnabled = true; B.isEnabled = true
        N.isEnabled = true; M.isEnabled = true; Back.isEnabled = true; Enter.isEnabled = true
    }
    func defaultmainletters() {
        mainLetter1.image = Dictionary.startRoundedLetterDictionary[Assigner.startingWord[0]]
        mainLetter2.image = Dictionary.startRoundedLetterDictionary[Assigner.startingWord[1]]
        mainLetter3.image = Dictionary.startRoundedLetterDictionary[Assigner.startingWord[2]]
        mainLetter4.image = Dictionary.startRoundedLetterDictionary[Assigner.startingWord[3]]
        mainLetter5.image = Dictionary.startRoundedLetterDictionary[Assigner.startingWord[4]]
    }
    
    func timeString(time:TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func runTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SpeedSolveViewController.gameTimerReduce)), userInfo: nil, repeats: true)
    }
    // Function to tell the application to take away 1 and show it on the time label
    @objc func gameTimerReduce() {
        gameInt -= 1
        countdownLabel.text = timeString(time: TimeInterval(gameInt))
        if gameInt == 0 {
            gameTimer.invalidate()
            readyLabel.alpha = 1
            readyLabel.text = "Out of time!"
            disableAllbuttons()
            restartButton.alpha = 1
            solutionButton.alpha = 1
            onboardImage.alpha = 0.5
            restartButton.isEnabled = true
            solutionButton.isEnabled = true
            startUpButton.isEnabled = false
            currentScore = 0
        }
    }
    func startCounting() {
        timeTakenTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SpeedSolveViewController.timeTakenIncrease)), userInfo: nil, repeats: true)
    }
    @objc func timeTakenIncrease() {
        timeTakenInt += 1
        finalTime = timeString(time: TimeInterval(timeTakenInt))
        if timeTakenInt == 180 {
            timeTakenTimer.invalidate()
        }
    }
    
    // Function to assign the correct letter images to the Goal Word
    
    func defaultGoalLetters() {
        goalLetter1.image = Dictionary.goalRoundedLetterDictionary[Assigner.goalWord[0]]
        goalLetter2.image = Dictionary.goalRoundedLetterDictionary[Assigner.goalWord[1]]
        goalLetter3.image = Dictionary.goalRoundedLetterDictionary[Assigner.goalWord[2]]
        goalLetter4.image = Dictionary.goalRoundedLetterDictionary[Assigner.goalWord[3]]
        goalLetter5.image = Dictionary.goalRoundedLetterDictionary[Assigner.goalWord[4]]
    }
    
    // Function to assign the correct letter images to the current attempt by the user.
    
    func AssigningImagesToView(attempt: Array<UIImage> , Try: Int) {
        if Try == 0 && attempt.count == 0 {
            A1L1.image = #imageLiteral(resourceName: "Asset 99"); A1L2.image = #imageLiteral(resourceName: "Asset 99"); A1L3.image = #imageLiteral(resourceName: "Asset 99"); A1L4.image = #imageLiteral(resourceName: "Asset 99"); A1L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 0 && attempt.count == 1 {
            A1L1.image = attempt[0]; A1L2.image = #imageLiteral(resourceName: "Asset 99"); A1L3.image = #imageLiteral(resourceName: "Asset 99"); A1L4.image = #imageLiteral(resourceName: "Asset 99"); A1L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 0 && attempt.count == 2 {
            A1L1.image = attempt[0]; A1L2.image = attempt[1]; A1L3.image = #imageLiteral(resourceName: "Asset 99"); A1L4.image = #imageLiteral(resourceName: "Asset 99"); A1L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 0 && attempt.count == 3 {
            A1L1.image = attempt[0]; A1L2.image = attempt[1]; A1L3.image = attempt[2]; A1L4.image = #imageLiteral(resourceName: "Asset 99"); A1L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 0 && attempt.count == 4 {
            A1L1.image = attempt[0]; A1L2.image = attempt[1]; A1L3.image = attempt[2]; A1L4.image = attempt[3]; A1L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 0 && attempt.count == 5 {
            A1L1.image = attempt[0]; A1L2.image = attempt[1]; A1L3.image = attempt[2]; A1L4.image = attempt[3]; A1L5.image = attempt[4]
            
        }  else if Try == 1 && attempt.count == 0 {
            A2L1.image = #imageLiteral(resourceName: "Asset 99"); A2L2.image = #imageLiteral(resourceName: "Asset 99"); A2L3.image = #imageLiteral(resourceName: "Asset 99"); A2L4.image = #imageLiteral(resourceName: "Asset 99"); A2L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 1 && attempt.count == 1 {
            A2L1.image = attempt[0]; A2L2.image = #imageLiteral(resourceName: "Asset 99"); A2L3.image = #imageLiteral(resourceName: "Asset 99"); A2L4.image = #imageLiteral(resourceName: "Asset 99"); A2L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 1 && attempt.count == 2 {
            A2L1.image = attempt[0]; A2L2.image = attempt[1]; A2L3.image = #imageLiteral(resourceName: "Asset 99"); A2L4.image = #imageLiteral(resourceName: "Asset 99"); A2L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 1 && attempt.count == 3 {
            A2L1.image = attempt[0]; A2L2.image = attempt[1]; A2L3.image = attempt[2]; A2L4.image = #imageLiteral(resourceName: "Asset 99"); A2L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 1 && attempt.count == 4 {
            A2L1.image = attempt[0]; A2L2.image = attempt[1]; A2L3.image = attempt[2]; A2L4.image = attempt[3]; A2L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 1 && attempt.count == 5 {
            A2L1.image = attempt[0]; A2L2.image = attempt[1]; A2L3.image = attempt[2]; A2L4.image = attempt[3]; A2L5.image = attempt[4]
            
        }  else if Try == 2 && attempt.count == 0 {
            A3L1.image = #imageLiteral(resourceName: "Asset 99"); A3L2.image = #imageLiteral(resourceName: "Asset 99"); A3L3.image = #imageLiteral(resourceName: "Asset 99"); A3L4.image = #imageLiteral(resourceName: "Asset 99"); A3L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 2 && attempt.count == 1 {
            A3L1.image = attempt[0]; A3L2.image = #imageLiteral(resourceName: "Asset 99"); A3L3.image = #imageLiteral(resourceName: "Asset 99"); A3L4.image = #imageLiteral(resourceName: "Asset 99"); A3L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 2 && attempt.count == 2 {
            A3L1.image = attempt[0]; A3L2.image = attempt[1]; A3L3.image = #imageLiteral(resourceName: "Asset 99"); A3L4.image = #imageLiteral(resourceName: "Asset 99"); A3L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 2 && attempt.count == 3 {
            A3L1.image = attempt[0]; A3L2.image = attempt[1]; A3L3.image = attempt[2]; A3L4.image = #imageLiteral(resourceName: "Asset 99"); A3L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 2 && attempt.count == 4 {
            A3L1.image = attempt[0]; A3L2.image = attempt[1]; A3L3.image = attempt[2]; A3L4.image = attempt[3]; A3L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 2 && attempt.count == 5 {
            A3L1.image = attempt[0]; A3L2.image = attempt[1]; A3L3.image = attempt[2]; A3L4.image = attempt[3]; A3L5.image = attempt[4]
            
        }  else if Try == 3 && attempt.count == 0 {
            A4L1.image = #imageLiteral(resourceName: "Asset 99"); A4L2.image = #imageLiteral(resourceName: "Asset 99"); A4L3.image = #imageLiteral(resourceName: "Asset 99"); A4L4.image = #imageLiteral(resourceName: "Asset 99"); A4L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 3 && attempt.count == 1 {
            A4L1.image = attempt[0]; A4L2.image = #imageLiteral(resourceName: "Asset 99"); A4L3.image = #imageLiteral(resourceName: "Asset 99"); A4L4.image = #imageLiteral(resourceName: "Asset 99"); A4L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 3 && attempt.count == 2 {
            A4L1.image = attempt[0]; A4L2.image = attempt[1]; A4L3.image = #imageLiteral(resourceName: "Asset 99"); A4L4.image = #imageLiteral(resourceName: "Asset 99"); A4L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 3 && attempt.count == 3 {
            A4L1.image = attempt[0]; A4L2.image = attempt[1]; A4L3.image = attempt[2]; A4L4.image = #imageLiteral(resourceName: "Asset 99"); A4L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 3 && attempt.count == 4 {
            A4L1.image = attempt[0]; A4L2.image = attempt[1]; A4L3.image = attempt[2]; A4L4.image = attempt[3]; A4L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 3 && attempt.count == 5 {
            A4L1.image = attempt[0]; A4L2.image = attempt[1]; A4L3.image = attempt[2]; A4L4.image = attempt[3]; A4L5.image = attempt[4]
            
        }  else if Try == 4 && attempt.count == 0 {
            A5L1.image = #imageLiteral(resourceName: "Asset 99"); A5L2.image = #imageLiteral(resourceName: "Asset 99"); A5L3.image = #imageLiteral(resourceName: "Asset 99"); A5L4.image = #imageLiteral(resourceName: "Asset 99"); A5L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 4 && attempt.count == 1 {
            A5L1.image = attempt[0]; A5L2.image = #imageLiteral(resourceName: "Asset 99"); A5L3.image = #imageLiteral(resourceName: "Asset 99"); A5L4.image = #imageLiteral(resourceName: "Asset 99"); A5L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 4 && attempt.count == 2 {
            A5L1.image = attempt[0]; A5L2.image = attempt[1]; A5L3.image = #imageLiteral(resourceName: "Asset 99"); A5L4.image = #imageLiteral(resourceName: "Asset 99"); A5L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 4 && attempt.count == 3 {
            A5L1.image = attempt[0]; A5L2.image = attempt[1]; A5L3.image = attempt[2]; A5L4.image = #imageLiteral(resourceName: "Asset 99"); A5L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 4 && attempt.count == 4 {
            A5L1.image = attempt[0]; A5L2.image = attempt[1]; A5L3.image = attempt[2]; A5L4.image = attempt[3]; A5L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 4 && attempt.count == 5 {
            A5L1.image = attempt[0]; A5L2.image = attempt[1]; A5L3.image = attempt[2]; A5L4.image = attempt[3]; A5L5.image = attempt[4]
            
        } else if Try == 5 && attempt.count == 0 {
            A6L1.image = #imageLiteral(resourceName: "Asset 99"); A6L2.image = #imageLiteral(resourceName: "Asset 99"); A6L3.image = #imageLiteral(resourceName: "Asset 99"); A6L4.image = #imageLiteral(resourceName: "Asset 99"); A6L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 5 && attempt.count == 1 {
            A6L1.image = attempt[0]; A6L2.image = #imageLiteral(resourceName: "Asset 99"); A6L3.image = #imageLiteral(resourceName: "Asset 99"); A6L4.image = #imageLiteral(resourceName: "Asset 99"); A6L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 5 && attempt.count == 2 {
            A6L1.image = attempt[0]; A6L2.image = attempt[1]; A6L3.image = #imageLiteral(resourceName: "Asset 99"); A6L4.image = #imageLiteral(resourceName: "Asset 99"); A6L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 5 && attempt.count == 3 {
            A6L1.image = attempt[0]; A6L2.image = attempt[1]; A6L3.image = attempt[2]; A6L4.image = #imageLiteral(resourceName: "Asset 99"); A6L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 5 && attempt.count == 4 {
            A6L1.image = attempt[0]; A6L2.image = attempt[1]; A6L3.image = attempt[2]; A6L4.image = attempt[3]; A6L5.image = #imageLiteral(resourceName: "Asset 99")
            
        } else if Try == 5 && attempt.count == 5 {
            A6L1.image = attempt[0]; A6L2.image = attempt[1]; A6L3.image = attempt[2]; A6L4.image = attempt[3]; A6L5.image = attempt[4]
            
        }else{ errorLabel.text = "You have already entered in a Word"}
    }
    
    // Function to print the letters to the UI in the correct spot when a user enters a letter.
    
    func printingLetters() {
        let attempt1 = Assigner.attempt1Images
        let attempt2 = Assigner.attempt2Images
        let attempt3 = Assigner.attempt3Images
        let attempt4 = Assigner.attempt4Images
        let attempt5 = Assigner.attempt5Images
        let attempt6 = Assigner.attempt6Images
        
        if tries == 0 {
            AssigningImagesToView(attempt: attempt1, Try: tries)
        }else if tries == 1 {
            AssigningImagesToView(attempt: attempt2, Try: tries)
        }else if tries == 2 {
            AssigningImagesToView(attempt: attempt3, Try: tries)
        }else if tries == 3 {
            AssigningImagesToView(attempt: attempt4, Try: tries)
        }else if tries == 4 {
            AssigningImagesToView(attempt: attempt5, Try: tries)
        }else if tries == 5 {
            AssigningImagesToView(attempt: attempt6, Try: tries)
        }
    }
    
    // Function to change the image on the UI when the user uses a letter needed for the goal word
    
    func correctLetters(Tries:Int) {
        defaultGoalLetters()
        var letters = Assigner.currentGuess(Tries:Tries)
        var gpos = 0
        while letters.count > 0 {
            print(letters)
            print(gpos)
            if letters[0] == Assigner.goalWord[gpos] {
                if goalLetter1.image == Dictionary.goalRoundedLetterDictionary[letters[0]]{
                    goalLetter1.image = Dictionary.correctRoundedLetterDictionary[letters[0]]
                    letters.remove(at: 0)
                    gpos = 0
                    print("Letter 1")
                }else if goalLetter2.image == Dictionary.goalRoundedLetterDictionary[letters[0]]{
                    goalLetter2.image = Dictionary.correctRoundedLetterDictionary[letters[0]]
                    letters.remove(at: 0)
                    gpos = 0
                    print("Letter 2")
                }else if goalLetter3.image == Dictionary.goalRoundedLetterDictionary[letters[0]]{
                    goalLetter3.image = Dictionary.correctRoundedLetterDictionary[letters[0]]
                    letters.remove(at: 0)
                    gpos = 0
                    print("Letter 3")
                }else if goalLetter4.image == Dictionary.goalRoundedLetterDictionary[letters[0]]{
                    goalLetter4.image = Dictionary.correctRoundedLetterDictionary[letters[0]]
                    letters.remove(at: 0)
                    gpos = 0
                    print("Letter 4")
                }else if goalLetter5.image == Dictionary.goalRoundedLetterDictionary[letters[0]]{
                    goalLetter5.image = Dictionary.correctRoundedLetterDictionary[letters[0]]
                    letters.remove(at: 0)
                    gpos = 0
                    print("Letter 5")
                }else{letters.remove(at: 0)}
            }else if gpos == 5 {
                letters.remove(at: 0)
                gpos = 0
            }else {gpos = gpos + 1}
        }
    }
    
    // Function to set all of the image alphas (transparency) TO .75. Mainly for viewing (UX)
    
    func resetAlpha() {
        A1L1.alpha = 0.75; A1L2.alpha = 0.75; A1L3.alpha = 0.75; A1L4.alpha = 0.75; A1L5.alpha = 0.75
        A2L1.alpha = 0.75; A2L2.alpha = 0.75; A2L3.alpha = 0.75; A2L4.alpha = 0.75; A2L5.alpha = 0.75
        A3L1.alpha = 0.75; A3L2.alpha = 0.75; A3L3.alpha = 0.75; A3L4.alpha = 0.75; A3L5.alpha = 0.75
        A4L1.alpha = 0.75; A4L2.alpha = 0.75; A4L3.alpha = 0.75; A4L4.alpha = 0.75; A4L5.alpha = 0.75
        A5L1.alpha = 0.75; A5L2.alpha = 0.75; A5L3.alpha = 0.75; A5L4.alpha = 0.75; A5L5.alpha = 0.75
        A6L1.alpha = 0.75; A6L2.alpha = 0.75; A6L3.alpha = 0.75; A6L4.alpha = 0.75; A6L5.alpha = 0.75
    }
    
    // Function to set the current guess images to opaque (alpha = 1). Mainly for viewing (UX)
    
    func setAlpha(Tries: Int) {
        resetAlpha()
        switch Tries {
        case 0:
            A1L1.alpha = 1; A1L2.alpha = 1; A1L3.alpha = 1; A1L4.alpha = 1; A1L5.alpha = 1
        case 1:
            A2L1.alpha = 1; A2L2.alpha = 1; A2L3.alpha = 1; A2L4.alpha = 1; A2L5.alpha = 1
        case 2:
            A3L1.alpha = 1; A3L2.alpha = 1; A3L3.alpha = 1; A3L4.alpha = 1; A3L5.alpha = 1
        case 3:
            A4L1.alpha = 1; A4L2.alpha = 1; A4L3.alpha = 1; A4L4.alpha = 1; A4L5.alpha = 1
        case 4:
            A5L1.alpha = 1; A5L2.alpha = 1; A5L3.alpha = 1; A5L4.alpha = 1; A5L5.alpha = 1
        case 5:
            A6L1.alpha = 1; A6L2.alpha = 1; A6L3.alpha = 1; A6L4.alpha = 1; A6L5.alpha = 1
        default:
            resetAlpha()
        }
    }
    func resetImages() {
        A1L1.image = #imageLiteral(resourceName: "Asset 99"); A1L2.image = #imageLiteral(resourceName: "Asset 99"); A1L3.image = #imageLiteral(resourceName: "Asset 99"); A1L4.image = #imageLiteral(resourceName: "Asset 99"); A1L5.image = #imageLiteral(resourceName: "Asset 99")
        A2L1.image = #imageLiteral(resourceName: "Asset 99"); A2L2.image = #imageLiteral(resourceName: "Asset 99"); A2L3.image = #imageLiteral(resourceName: "Asset 99"); A2L4.image = #imageLiteral(resourceName: "Asset 99"); A2L5.image = #imageLiteral(resourceName: "Asset 99")
        A3L1.image = #imageLiteral(resourceName: "Asset 99"); A3L2.image = #imageLiteral(resourceName: "Asset 99"); A3L3.image = #imageLiteral(resourceName: "Asset 99"); A3L4.image = #imageLiteral(resourceName: "Asset 99"); A3L5.image = #imageLiteral(resourceName: "Asset 99")
        A4L1.image = #imageLiteral(resourceName: "Asset 99"); A4L2.image = #imageLiteral(resourceName: "Asset 99"); A4L3.image = #imageLiteral(resourceName: "Asset 99"); A4L4.image = #imageLiteral(resourceName: "Asset 99"); A4L5.image = #imageLiteral(resourceName: "Asset 99")
        A5L1.image = #imageLiteral(resourceName: "Asset 99"); A5L2.image = #imageLiteral(resourceName: "Asset 99"); A5L3.image = #imageLiteral(resourceName: "Asset 99"); A5L4.image = #imageLiteral(resourceName: "Asset 99"); A5L5.image = #imageLiteral(resourceName: "Asset 99")
        A6L1.image = #imageLiteral(resourceName: "Asset 99"); A6L2.image = #imageLiteral(resourceName: "Asset 99"); A6L3.image = #imageLiteral(resourceName: "Asset 99"); A6L4.image = #imageLiteral(resourceName: "Asset 99"); A6L5.image = #imageLiteral(resourceName: "Asset 99")
    }
    
    func gameRestart() {
        startTimer.invalidate()
        gameTimer.invalidate()
        timeTakenTimer.invalidate()
        startInt = 5
        gameInt = 180
        timeTakenInt = 0
        tries = 0
        readyLabel.alpha = 0
        restartButton.isEnabled = false
        solutionButton.isEnabled = false
        restartButton.alpha = 0
        solutionButton.alpha = 0
        errorLabel.alpha = 0
        setAlpha(Tries: tries)
        resetImages()
        Assigner.restart()
        Assigner.GenerateAnswerAndGoal()
        defaultmainletters()
        defaultGoalLetters()
        startUpButton.isEnabled = false
        startCounter.alpha = 1
        startUpButton.alpha = 0
        readyLabel.alpha = 0
        onboardImage.alpha = 0
        infoLabel.alpha = 0
        errorLabel.textColor = .red
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SpeedSolveViewController.startTimeReduce)), userInfo: nil, repeats: true)
    }
}


        
        
        
