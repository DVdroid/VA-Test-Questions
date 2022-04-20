//
//  SecondHighestNumberInArray.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 20/04/22.
//  Copyright © 2022 Vikash Anand. All rights reserved.
//

import Foundation

final class SecondHighestNumberInArray {
    
    static func secondHighestNumber(in numbers: [Int]) -> Int {
        if numbers.count == 1 { return -1 }
        
        guard let largestNumber = numbers.max() else { return -1 }
        var secondLargestNumber = min(numbers[0], numbers[1])
        if numbers.count == 2 {
            guard largestNumber == secondLargestNumber else { return -1 }
            return secondLargestNumber
        }
        
        for number in numbers[2...] where (number > secondLargestNumber && number < largestNumber) {
            secondLargestNumber = number
        }
        
        if secondLargestNumber == largestNumber { return -1 }
        return secondLargestNumber
    }
}
