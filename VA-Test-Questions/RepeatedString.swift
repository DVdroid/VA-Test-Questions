//
//  RepeatedString.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 05/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class RepeatedString {

    class func repeatedString(s: String, n: Int) -> Int {

        var countOfA = 0
        for character in s {
            if character == "a" {
                countOfA += 1
            }
        }

        countOfA *= (n / s.count)
        let reminder = n % s.count
        if reminder > 0 {
            for index in 0..<reminder {
                let charIndex = s.index(s.startIndex, offsetBy: index)
                if s[charIndex] == "a" {
                    countOfA += 1
                }
            }
        }
        return countOfA
    }

}
