//
//  Assigning Letters.swift
//  SpeedSolve
//
//  Created by Craig Quinn on 03/02/2022.
//

import Foundation
import UIKit


extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

struct Assignment {
    
    var attempt1Images = [UIImage]()
    var attempt2Images = [UIImage]()
    var attempt3Images = [UIImage]()
    var attempt4Images = [UIImage]()
    var attempt5Images = [UIImage]()
    var attempt6Images = [UIImage]()
    
    var attempt1Letters = [String]()
    var attempt2Letters = [String]()
    var attempt3Letters = [String]()
    var attempt4Letters = [String]()
    var attempt5Letters = [String]()
    var attempt6Letters = [String]()
    
    var errorMessage = String()
    
    var previousWord = String()
    var currentWord = String()
    var solutionword1 = String()
    var solutionword2 = String()
    var solutionword3 = String()
    var solutionword4 = String()
    var solutionword5 = String()
    var goalWord = String()
    var startingWord = String()

    
    mutating func currentGuess(Tries:Int) -> [String] {
        if Tries == 0 {
            return attempt1Letters
        }else if Tries == 1 {
            return attempt2Letters
        }else if Tries == 2 {
            return attempt3Letters
        }else if Tries == 3 {
            return attempt4Letters
        }else if Tries == 4 {
            return attempt5Letters
        }else {return []}
    }
        
    mutating func GenerateAnswerAndGoal(){
        
        let dictionary = Dictionaries().fiveLetterWords.shuffled()
        var solutionnumber = 0
        while solutionnumber < 6 {
            if solutionnumber == 0{
                var int1 = 1
                while solutionnumber == 0 {
                    startingWord = dictionary[0]
                    if acceptableword(previousWord: startingWord, testword: dictionary[int1]) {
                        solutionword1 = dictionary[int1]
                        print("the starting word is \(startingWord)")
                        print( solutionword1)
                        solutionnumber = solutionnumber + 1
                    }else{
                        int1 = int1 + 1}
                }
            }else if solutionnumber == 1 {
                var int2 = 1
                while solutionnumber == 1{
                    if dictionary[int2] != solutionword1 && acceptableword(previousWord: solutionword1, testword: dictionary[int2]) {
                        solutionword2 = dictionary[int2]
                        print(solutionword2)
                        solutionnumber = solutionnumber + 1
                    }else{int2 = int2 + 1}
                }
            }else if solutionnumber == 2 {
                var int3 = 1
                while solutionnumber == 2 {
                    if dictionary[int3] != solutionword1 && dictionary[int3] != solutionword2 && acceptableword(previousWord: solutionword2, testword: dictionary[int3]) {
                        solutionword3 = dictionary[int3]
                        print(solutionword3)
                        solutionnumber = solutionnumber + 1
                    }else{int3 = int3 + 1}
                }
            }else if solutionnumber == 3 {
                var int4 = 1
                while solutionnumber == 3 {
                    if dictionary[int4] != solutionword1 && dictionary[int4] != solutionword2 && dictionary[int4] != solutionword3 && acceptableword(previousWord: solutionword3, testword: dictionary[int4]) {
                        solutionword4 = dictionary[int4]
                        print(solutionword4)
                        solutionnumber = solutionnumber + 1
                    }else{int4 = int4 + 1}
                }
            }else if solutionnumber == 4 {
                var int5 = 1
                while solutionnumber == 4 {
                    if dictionary[int5] != solutionword1 && dictionary[int5] != solutionword2 && dictionary[int5] != solutionword3 && dictionary[int5] != solutionword4 && acceptableword(previousWord: solutionword4, testword: dictionary[int5]) {
                        solutionword5 = dictionary[int5]
                        print(solutionword5)
                        solutionnumber = solutionnumber + 1
                    }else {int5 = int5 + 1}
                }
            }else {
                var goal = 1
                while solutionnumber == 5 {
                    if dictionary[goal] != solutionword1 && dictionary[goal] != solutionword2 && dictionary[goal] != solutionword3 && dictionary[goal] != solutionword4 && dictionary[goal] != solutionword5 && acceptableword(previousWord: solutionword5, testword: dictionary[goal]) {
                        goalWord = dictionary[goal]
                        print(goalWord)
                        solutionnumber = solutionnumber + 1
                        
                    }else {goal = goal + 1}
                }
            }
        }
    }
    
    mutating func acceptableword( previousWord: String, testword: String) -> Bool {

        var letterIndex1 = 0
        var letterIndex2 = 0
        var final = 0
        var sameLetters = 0
    

        var word1 = [previousWord[0], previousWord[1], previousWord[2], previousWord[3], previousWord[4]]
        var word2 = [testword[0], testword[1], testword[2], testword[3], testword[4]]
        while final == 0{
            if word1.count != 0 {
                if word2[letterIndex2] == word1[letterIndex1] {  // If the letter(x) in word 1 is the same as letter(y) in word 2
                    word1.remove(at: letterIndex1) ; word2.remove(at: letterIndex2) // remove the letters from the words
                    letterIndex1 = 0 // set the indexes back to 0
                    letterIndex2 = 0
                    sameLetters = sameLetters + 1 // add 1 to the same letters count
                }else if word1.count-1 > letterIndex1 {
                    letterIndex1 += 1
                }else if letterIndex1 == word1.count-1 {
                    letterIndex1 = 0
                    if letterIndex2 < word2.count-1 {
                        letterIndex2 += 1
                    }else{ final = 1}
                }else{final = 1}
            }else{final = 1}
        }
        if sameLetters < 4 {
            return false
        }else{return true}

    }
        

             
    
    
    
//    mutating func acceptableword(previousWord: String, testword: String) -> Bool {
//        if previousWord.contains(testword[0]) && previousWord.contains(testword[1]) && previousWord.contains(testword[2]) && previousWord.contains(testword[3]) ||
//            previousWord.contains(testword[0]) && previousWord.contains(testword[1]) && previousWord.contains(testword[2]) && previousWord.contains(testword[4]) ||
//            previousWord.contains(testword[0]) && previousWord.contains(testword[1]) && previousWord.contains(testword[3]) && previousWord.contains(testword[4]) ||
//            previousWord.contains(testword[0]) && previousWord.contains(testword[2]) && previousWord.contains(testword[3]) && previousWord.contains(testword[4]) ||
//            previousWord.contains(testword[1]) && previousWord.contains(testword[2]) && previousWord.contains(testword[3]) && previousWord.contains(testword[4]){
//            return true
//        }else{
//            return false}
//    }
    
    mutating func assignLetterstoArrays(Letter: String , Image: UIImage, Tries: Int){
        
        if attempt1Images.count <= 4 && Tries == 0{
            attempt1Images.append(Image)
            attempt1Letters.append(Letter)
        }else if attempt2Images.count <= 4 && Tries == 1 {
            attempt2Images.append(Image)
            attempt2Letters.append(Letter)
        }else if attempt3Images.count <= 4 && Tries == 2 {
            attempt3Images.append(Image)
            attempt3Letters.append(Letter)
        }else if attempt4Images.count <= 4 && Tries == 3 {
            attempt4Images.append(Image)
            attempt4Letters.append(Letter)
        }else if attempt5Images.count <= 4 && Tries == 4 {
            attempt5Images.append(Image)
            attempt5Letters.append(Letter)
        }else if attempt5Images.count <= 5 && Tries == 5 {
            attempt6Images.append(Image)
            attempt6Letters.append(Letter)
        }else {
            errorMessage = "Please delete or submit current Answer" }
    }
    
    mutating func deleteLetters(Tries: Int){
        
        if Tries == 0 && attempt1Letters.count > 0 {
            attempt1Images.removeLast()
            attempt1Letters.removeLast()
        }else if Tries == 1 && attempt2Letters.count > 0 {
            attempt2Images.removeLast()
            attempt2Letters.removeLast()
        }else if Tries == 2 && attempt3Letters.count > 0 {
            attempt3Images.removeLast()
            attempt3Letters.removeLast()
        }else if Tries == 3 && attempt4Letters.count > 0 {
            attempt4Images.removeLast()
            attempt4Letters.removeLast()
        }else if Tries == 4 && attempt5Letters.count > 0 {
            attempt5Images.removeLast()
            attempt5Letters.removeLast()
        }else if Tries == 5 && attempt6Letters.count > 0 {
            attempt6Images.removeLast()
            attempt6Letters.removeLast()
        }else {}
    }
    
    mutating func wordIsValid() -> Bool {
        
        if Dictionaries.init().fiveLetterWords.contains(currentWord){
            return true
        }else{return false}
    }
    
    mutating func lastWord(Tries: Int){
        
        switch Tries {
        case 0:
            previousWord = self.startingWord
        case 1:
            previousWord = attempt1Letters[0] + attempt1Letters[1] + attempt1Letters[2] + attempt1Letters[3] + attempt1Letters[4]
        case 2:
            previousWord = attempt2Letters[0] + attempt2Letters[1] + attempt2Letters[2] + attempt2Letters[3] + attempt2Letters[4]
        case 3:
            previousWord = attempt3Letters[0] + attempt3Letters[1] + attempt3Letters[2] + attempt3Letters[3] + attempt3Letters[4]
        case 4:
            previousWord = attempt4Letters[0] + attempt4Letters[1] + attempt4Letters[2] + attempt4Letters[3] + attempt4Letters[4]
        case 5:
            previousWord = attempt5Letters[0] + attempt5Letters[1] + attempt5Letters[2] + attempt5Letters[3] + attempt5Letters[4]
        default:
            previousWord = self.startingWord
        }
    }
    mutating func yourNextWord(Tries: Int){
        
        switch Tries {
            
        case 0:
            currentWord = attempt1Letters[0] + attempt1Letters[1] + attempt1Letters[2] + attempt1Letters[3] + attempt1Letters[4]
        case 1:
            currentWord = attempt2Letters[0] + attempt2Letters[1] + attempt2Letters[2] + attempt2Letters[3] + attempt2Letters[4]
        case 2:
            currentWord = attempt3Letters[0] + attempt3Letters[1] + attempt3Letters[2] + attempt3Letters[3] + attempt3Letters[4]
        case 3:
            currentWord = attempt4Letters[0] + attempt4Letters[1] + attempt4Letters[2] + attempt4Letters[3] + attempt4Letters[4]
        case 4:
            currentWord = attempt5Letters[0] + attempt5Letters[1] + attempt5Letters[2] + attempt5Letters[3] + attempt5Letters[4]
        case 5:
            currentWord = attempt6Letters[0] + attempt6Letters[1] + attempt6Letters[2] + attempt6Letters[3] + attempt6Letters[4]
        default:
            currentWord = String()
        }
    }
    
    
    
    mutating func wordisaccepted() -> Bool {
        if previousWord.contains(currentWord[0]) && previousWord.contains(currentWord[1]) && previousWord.contains(currentWord[2]) && previousWord.contains(currentWord[3]) ||
            previousWord.contains(currentWord[0]) && previousWord.contains(currentWord[1]) && previousWord.contains(currentWord[2]) && previousWord.contains(currentWord[4]) ||
            previousWord.contains(currentWord[0]) && previousWord.contains(currentWord[1]) && previousWord.contains(currentWord[3]) && previousWord.contains(currentWord[4]) ||
            previousWord.contains(currentWord[0]) && previousWord.contains(currentWord[2]) && previousWord.contains(currentWord[3]) && previousWord.contains(currentWord[4]) ||
            previousWord.contains(currentWord[1]) && previousWord.contains(currentWord[2]) && previousWord.contains(currentWord[3]) && previousWord.contains(currentWord[4]){
            return true
        }else{
            print(currentWord)
            print(previousWord)
            return false}
        
    }
func invalidword(Tries: Int) -> Bool {
    if Tries == 0 {
        if attempt1Letters.count != 5 {
            print(attempt1Letters)
            return true
        }else{return false}
    }else if Tries == 1 {
        if attempt2Letters.count != 5 {
            return true
        }else{return false}
    }else if Tries == 2 {
        if attempt3Letters.count != 5 {
            return true
        }else{return false}
    }else if Tries == 3 {
        if attempt4Letters.count != 5 {
            return true
        }else{return false}
    }else if Tries == 4 {
        if attempt5Letters.count != 5 {
            return true
        }else{return false}
    }else if Tries == 5 {
        if attempt6Letters.count != 5 {
            return true
        }else{return false}
    }else{return false}
}
    
    func checker() -> Bool {
        
        if currentWord == goalWord {
            return true
        }else {return false}
    }
    
    mutating func restart(){
        attempt1Images.removeAll()
        attempt2Images.removeAll()
        attempt3Images.removeAll()
        attempt4Images.removeAll()
        attempt5Images.removeAll()
        attempt6Images.removeAll()
        
        attempt1Letters.removeAll()
        attempt2Letters.removeAll()
        attempt3Letters.removeAll()
        attempt4Letters.removeAll()
        attempt5Letters.removeAll()
        attempt6Letters.removeAll()
        
        previousWord.removeAll()
        currentWord.removeAll()
        solutionword1.removeAll()
        solutionword2.removeAll()
        solutionword3.removeAll()
        solutionword4.removeAll()
        solutionword5.removeAll()
        goalWord.removeAll()
        startingWord.removeAll()
    }
}













