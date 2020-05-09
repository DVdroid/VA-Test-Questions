//
//  SherlockAnagrams.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 07/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class SherlockAnagrams {

    class func sherlockAndAnagrams_Old(s: String) -> Int {

        var allAnagramCount = 0
        for i in 0..<(s.count - 1) {

            for j in i..<(s.count - 1) {
                let subString = String(s[s.index(s.startIndex, offsetBy: i)...s.index(s.startIndex, offsetBy: j)])
                let subStringCount = subString.count - 1

                for k in i+1..<(s.count - subStringCount) {
                    let startIndex = s.index(s.startIndex, offsetBy: k)
                    let endEndIndex = s.index(s.startIndex, offsetBy: (subStringCount + k))
                    let currentSubString = String(s[startIndex...endEndIndex])

                    if subString.sorted() == currentSubString.sorted() {
                        print(subString, currentSubString)
                        allAnagramCount += 1
                    }
                }
            }
        }

        return allAnagramCount
    }

    class func sherlockAndAnagrams(s: String) -> Int {

        let chars = Array(s)
        var anagrams = 0

        for length in 0...(chars.count - 2) {
            var subset: [String: Int] = [:]

            for i in 0..<(chars.count - length) {
                let text = String(chars[i...(i+length)].sorted())
                subset[text] = (subset[text] ?? 0) + 1
            }

            for element in subset {
                anagrams += element.value * (element.value - 1) / 2
            }
        }

        return anagrams
    }

}
