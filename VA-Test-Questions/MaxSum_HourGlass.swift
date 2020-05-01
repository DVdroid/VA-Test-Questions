//
//  MaxSum_HourGlass.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 01/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class MaxSum_HourGlass {

    class func maxSumAmongAllHourGlasses(in array: [[Int]]) -> Int {
        var sum = Int.min
        var yIndex = 0
        var xIndex = 0

        func maxSumForHourGlasses(in array: [[Int]], from yIndex: Int, to xIndex: Int) {

            let tempSum = array[yIndex][xIndex] + array[yIndex][xIndex + 1] + array[yIndex][xIndex + 2]
            + array[yIndex + 1][xIndex + 1]
            + array[yIndex + 2][xIndex] + array[yIndex + 2][xIndex + 1] + array[yIndex + 2][xIndex + 2]

            print(array[yIndex][xIndex] , array[yIndex][xIndex + 1] , array[yIndex][xIndex + 2])
            print(array[yIndex + 1][xIndex + 1])
            print(array[yIndex + 2][xIndex] , array[yIndex + 2][xIndex + 1] , array[yIndex + 2][xIndex + 2])

            sum = max(tempSum, sum)
            print(tempSum, sum)
            print("\n\n\n\n")

            if xIndex < (array[xIndex].count - 3) {
                maxSumForHourGlasses(in: array, from: yIndex, to: (xIndex + 1))
            }
        }

        for yIndex in 0..<(array.count - 2) {
            maxSumForHourGlasses(in: array, from: yIndex, to: 0)
        }

        return sum
    }
}
