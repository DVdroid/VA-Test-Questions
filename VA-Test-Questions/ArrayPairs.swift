//
//  ArrayPairs.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 03/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class ArrayPairs {

    class func findArrayPairs(in array: [Int]) -> Int {
        print(calculatePrefixMultiplicationArray(from: array))
        
        var counter = 0
        for i in 0..<array.count {
            for j in (i+1)..<array.count {
                print("{\(array[i]),\(array[j])}")

                let multiplication = array[i] * array[j]
                let maxInRange = array[i...j].max() ?? 0
                if multiplication <= maxInRange {
                    counter += 1
                }
            }
        }

        return counter
    }

    class func calculatePrefixMultiplicationArray(from array: [Int]) -> [Int] {
        var prefixMultiplicationArray = array
        for index in 0..<array.count {
            if index == 0 {
                prefixMultiplicationArray[index] = array[index]
            } else {
                prefixMultiplicationArray[index] = array[index] * prefixMultiplicationArray[index - 1]
            }
        }
        return prefixMultiplicationArray
    }
}
