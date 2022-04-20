//
//  SumOf3Integers.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 10/08/21.
//  Copyright © 2021 Vikash Anand. All rights reserved.
//

import Foundation

final class SumOfd3Integers {

    private class func isSumOfAny2(in numbers: [Int], equalsTo result: Int, startIndex: Int) -> Bool {
        var i = startIndex
        var j = numbers.count - 1

        while i < j {

            let sum = numbers[i] + numbers[j]
            if  sum == result { return true }

            if sum < result {
                i += 1
            } else {
                j -= 1
            }
        }

        return false
    }

    class func isSumOfAny3(in numbers: [Int],
                       equals result: Int) -> Bool {
        var mutableNumbers = numbers
        mutableNumbers = mutableNumbers.sorted()

        for number in (0...mutableNumbers.count - 2) {
            let remainder = result - number
            if isSumOfAny2(in: mutableNumbers, equalsTo: remainder, startIndex: mutableNumbers.count - 2) {
                return true
            }
        }
        return false
    }
}
