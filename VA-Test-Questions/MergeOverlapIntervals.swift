//
//  MergeOverlapIntervals.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 11/08/21.
//  Copyright © 2021 Vikash Anand. All rights reserved.
//

import Foundation

final class MergeOverlapIntervals {

    class func merge(intervals: [(Int, Int)]) -> [(Int, Int)] {
        var minimum = intervals.first?.0 ?? 0
        var maximum = intervals.first?.1 ?? 0

        for index in (1...intervals.count - 1) {
            let interval = intervals[index]

            minimum = min(minimum, interval.0)
            maximum = max(maximum, interval.1)
        }
        return [(minimum, maximum)]
    }
}
