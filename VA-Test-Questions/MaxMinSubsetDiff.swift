//
//  MaxMinSubsetDiff.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 27/04/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class MaxMinSubsetDiff {

    class func maxMinSubsetDiff() -> Int {
        let inputArray = [-3, -1, 4]
        //let inputArray = [2, 2, 2, 2]
        return diffOfMaxMinSubSetSum(for: inputArray)
    }

    class func diffOfMaxMinSubSetSum(for inputArray: [Int]) -> Int {

        var maxSum = 0
        var minSum = -10000
        for i in 0..<inputArray.count {
            for j in i..<inputArray.count {

                let key = Array(inputArray[i...j])
                let sum = key.reduce(0, +)

                if maxSum < sum {
                    maxSum = sum
                }
                if minSum == -10000 || minSum > sum {
                    minSum = sum
                }
            }
        }
        return (maxSum - minSum)
    }

    class func printSubSequence(for inputArray: [Int],
                                with elementCount: Int,
                                from startIndex: Int,
                                 to endIndex: Int) -> Int {

        if startIndex < elementCount {
            var maxSum = 0

            func printSubSequence(for inputArray: [Int],
                                  from startIndex: Int,
                                  to endIndex: Int) -> Int {


                if endIndex < elementCount {
                    let sequence = Array(inputArray[startIndex...endIndex])
                    let sum = sequence.reduce(0, +)
                    print(sequence, sum)
                    if maxSum < sum {
                        maxSum = sum
                    }
                    return printSubSequence(for: inputArray, from: startIndex, to: (endIndex + 1))
                }

                return maxSum
            }

            maxSum = printSubSequence(for: inputArray, from: startIndex, to: endIndex)
        }

        var maxSum = 0
        if (startIndex < elementCount) {
            maxSum = printSubSequence(for: inputArray, with: elementCount, from: startIndex + 1, to: endIndex + 1)
        }
        return maxSum
    }
}
