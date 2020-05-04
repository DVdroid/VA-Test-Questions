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

        var downPathStack:[Character] = []
        var upwardCounter = 0
        var valleyCount = 0

        for character in s {
            switch  character {
            case "U":
                if downPathStack.isEmpty {
                    upwardCounter += 1
                } else {
                    downPathStack.removeLast()
                    if downPathStack.isEmpty {
                        valleyCount += 1
                    }
                }
            case "D":
                if upwardCounter > 0 {
                    upwardCounter -= 1
                } else {
                    downPathStack.append(character)
                }
            default:
                print("Invalid character")
            }
        }

        return valleyCount
    }

}
