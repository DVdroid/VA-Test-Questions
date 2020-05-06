//
//  ArrayRotation.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 06/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class ArrayRotation {

    class func rotateLeftOld(a: [Int], d: Int) -> [Int] {
        let subArray = a[d...]
        let rotatedSubArray = a[..<d]
        return Array(subArray + rotatedSubArray)
    }

    class func rotateLeft(a: [Int], d: Int) -> [Int] {

        var tempArray = a
        for _ in 0..<d {
            let tempChar = tempArray[0]
            for index in 0..<(tempArray.count - 1) {
                tempArray[index] = tempArray[index + 1]
            }
            tempArray[tempArray.count - 1] = tempChar
        }
        return tempArray
    }

    class func rotateLeftWithRecursion(a: [Int], d: Int) -> [Int] {

        var tempArray = a
        var rotationCounter = d

        func rotateLeft(a: [Int]) {
            let tempChar = tempArray[0]
            for index in 0..<(tempArray.count - 1) {
                tempArray[index] = tempArray[index + 1]
            }
            tempArray[tempArray.count - 1] = tempChar
            rotationCounter -= 1

            if rotationCounter > 0 {
                rotateLeft(a: tempArray)
            }
        }

        rotateLeft(a: tempArray)
        return tempArray
    }
}
