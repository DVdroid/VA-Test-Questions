//
//  MaxSumOfTwoNumInArray.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 17/10/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

enum MyError: Error {
    case notFound
}

let values = [8,3,1,9]
let sum = 17

final class MaxSumOfTwoNumInArray {
    
    func findMaxSum(numbers: [Int]) -> Int {
        var largestNumber = max(numbers[0], numbers[1])
        var secondLargestNumber = min(numbers[0], numbers[1])
        for number in numbers[2...] {
            
            if number > largestNumber {
                secondLargestNumber = largestNumber
                largestNumber = number
            } else if number > secondLargestNumber {
                secondLargestNumber = number
            }
            print(number, largestNumber, secondLargestNumber)
        }
        return largestNumber + secondLargestNumber
    }
}




