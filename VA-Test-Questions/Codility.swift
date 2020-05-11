//
//  Codility.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 09/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class Codility {

    class func solution_old(_ s: inout String, _ C: inout [Int]) -> Int {

        let chars = Array(s)
        var deletionCost = 0
        var charCountDictionary: [String: Int] = [:]
        for (index, char) in chars.enumerated() {

            if index < (chars.count - 1) {
                let key = String(char)
                if char == chars[index + 1] {
                    deletionCost += C[index] < C[index + 1] ?  C[index] : C[index + 1]
                    charCountDictionary[key] = C[index]
                } else {
                    charCountDictionary[key] = (charCountDictionary[key] ?? 0) + C[index]
                }
            }
        }

        return deletionCost
    }

    class func solution(_ s: inout String, _ C: inout [Int]) -> Int {

        var index = 0
        while index < (s.count - 1) {
            let currentIndex = s.index(s.startIndex, offsetBy: index)
            let nextCharIndex = s.index(s.startIndex, offsetBy: (index + 1))
            if s[currentIndex] != s[nextCharIndex] {

                if index > 0 {

                    //When pair is already found and the next element after the pair doesn't matches the pair
                    //Backtrack compare the pair and delete the max b/w the pair
                    let previousCharIndex = s.index(s.startIndex, offsetBy: (index - 1))
                    if s[previousCharIndex] == s[currentIndex] {

                        if C[index - 1] < C[index] {
                            s.remove(at: currentIndex)
                            C.remove(at: index)
                        } else {
                            s.remove(at: previousCharIndex)
                            C.remove(at: (index - 1))
                        }

                        print(s, C)
                    }

                } else {
                    //If current char doesn't matches with next one, delete the current char
                    s.remove(at: currentIndex)
                    C.remove(at: index)
                    print(s, C)
                }
            } else {

                //If current char matches with next one, increment the index and keep
                //looking foe more matches
                index += 1

                if s.count == (index + 1) {

                    //When pair is already found and the next element after the pair doesn't matches the pair
                    //Backtrack compare the pair and delete the max b/w the pair
                    let previousCharIndex = s.index(s.startIndex, offsetBy: (index - 1))
                    if s[previousCharIndex] == s[currentIndex] {

                        if C[index - 1] < C[index] {
                            s.remove(at: currentIndex)
                            C.remove(at: index)
                        } else {
                            s.remove(at: previousCharIndex)
                            C.remove(at: (index - 1))
                        }

                        print(s, C)
                    }
                }
            }
        }

        print(s)
        print(C)
        return C.reduce(0, +)
    }
}
