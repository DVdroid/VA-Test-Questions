//
//  CountingValleys.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 04/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class CountingValleys {

    class func countingValleys(n: Int, s: String) -> Int {

        var levelCount = 0
        var valleyCount = 0

        for character in s {
            switch  character {
            case "U":
                levelCount += 1
                if levelCount == 0 {
                    valleyCount += 1
                }
            case "D":
                levelCount -= 1
            default:
                print("Invalid character")
            }
        }

        return valleyCount
    }

}
