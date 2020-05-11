//
//  Min_Swaps.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 09/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class Min_Swaps {

    class func minimumSwaps(arr: [Int]) -> Int {

        var swapsDone = 0
        var numArray = arr
        var currentIndex = 0

        while (currentIndex < (numArray.count - 2)) {
            if numArray[currentIndex] == (currentIndex + 1) {
                    currentIndex += 1
            } else {
                swapsDone += 1
                numArray.swapAt(currentIndex, (numArray[currentIndex] - 1))
            }
            print(numArray)
        }

        return swapsDone
    }
}
