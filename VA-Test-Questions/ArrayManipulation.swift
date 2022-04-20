//
//  DynamicArray_two.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 02/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class ArrayManipulation {

    // Complete the arrayManipulation function below.
    class func arrayManipulation(n: Int, queries: [[Int]]) -> Int {

        var array = Array<Int>(repeating: 0, count: n)
        for query in queries {
            array[query[0] - 1] += query[2]
            if query[1] != array.count {
                array[query[1]] -= query[2]
            }
        }

        var maxSum = Int.min
        var tempSum = 0
        for number in array {
            tempSum += number
            if tempSum > maxSum {
                maxSum = tempSum
            }
        }

        return maxSum
    }
}
