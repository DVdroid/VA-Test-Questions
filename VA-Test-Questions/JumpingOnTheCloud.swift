    //
    //  JumpingOnTheCloud.swift
    //  VA-Test-Questions
    //
    //  Created by Vikash Anand on 05/05/20.
    //  Copyright © 2020 Vikash Anand. All rights reserved.
    //

    import Foundation

    final class JumpingOnTheCloud {

        class func jumpingOnClouds(c: [Int]) -> Int {
            var totalSteps = 0
            var counter = 0
            let elementCount = c.count

            if elementCount < 4 {
                return 1
            }

            while counter < (elementCount - 3) {
                totalSteps += 1

                if c[counter + 2] == 1 {
                    counter += 1
                } else {
                    counter += 2
                }
            }

            if counter != (elementCount - 1)  {
                totalSteps += 1
            }

            return totalSteps
        }
    }
