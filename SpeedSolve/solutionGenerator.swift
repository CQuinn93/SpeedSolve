//
//  solutionGenerator.swift
//  SpeedSolve
//
//  Created by Craig Quinn on 17/01/2023.
//

import Foundation

struct Generator {
    
    
    
    
    mutating func Solvable() {
        
        let dictionary = Dictionaries.init().fiveLetterWords.shuffled()
        
        while goalword.isEmpty {
            if entry1 .isEmpty{
                while entry1.isEmpty {
                    let mainword = dictionary[0]
                    var int1 = 1
                    if wordisaccepted(previousWord: mainword, testword: dictionary[int1]) {
                        let entry1 = dictionary[int1]
                    }else{int1 += 1}
                }
            }else if entry2.isEmpty {
                var int2 = 1
                while entry2.isEmpty {
                    if dictionary[int2] != entry1 && wordisaccepted(previousWord: entry1, testword: dictionary[int2]) {
                        let entry2 = dictionary[int2]
                    }else{int2 += 1}
                }
            }else if entry3.isEmpty {
                var int3 = 1
                while entry3.isEmpty {
                    if dictionary[int3] != entry1 && dictionary[int3] != entry2 && wordisaccepted(previousWord: entry2, testword: dictionary[int3]) {
                        let entry3 = dictionary[int3]
                    }else{int3 += 1}
                }
            }else if entry4.isEmpty {
                var int4 = 1
                while entry4.isEmpty {
                    if dictionary[int4] != entry1 && dictionary[int4] != entry2 && dictionary[int4] != entry3 && wordisaccepted(previousWord: entry3, testword: dictionary[int4]) {
                        let entry4 = dictionary[int4]
                    }else{int4 += 1}
                }
            }else if entry5.isEmpty {
                while entry5.isEmpty {
                    var int5 = 1
                    if dictionary[int5] != entry1 && dictionary[int5] != entry2 && dictionary[int5] != entry3 && dictionary[int5] != entry4 && wordisaccepted(previousWord: entry4, testword: dictionary[int5]) {
                        let entry5 = dictionary[int5]
                    }else {int5 += 1}
                }
            }else {while goalword.isEmpty {
                var goal = 1
                if dictionary[goal] != entry1 && dictionary[goal] != entry2 && dictionary[goal] != entry3 && dictionary[goal] != entry4 && dictionary[goal] != entry5 && wordisaccepted(previousWord: entry5, testword: dictionary[goal]) {
                    let goalword = dictionary[goal]
                }else {goal += 1}
            }
            }
        }
    }
}

