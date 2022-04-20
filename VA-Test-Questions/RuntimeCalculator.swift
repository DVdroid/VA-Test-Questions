//
//  RuntimeCalculator.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 26/04/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

struct RuntimeCalculator {

    static func duration(for block: ()->Void) -> TimeInterval {

        let startDate = Date()
        block()
        let endDate = Date()
        return (endDate.timeIntervalSince(startDate))
    }

    static func compare(timeInterval1: TimeInterval, timeInterval2: TimeInterval) -> String {

        var outputString = ""
        if timeInterval1 > timeInterval2 {
            outputString = "Block 2 is faster then block 1"
        } else {
            outputString = "Block 1 is faster then block 2"
        }

        let timeintervalDifference = (timeInterval1 - timeInterval2).magnitude
        return outputString + " by " + "\(timeintervalDifference)"
    }
}
