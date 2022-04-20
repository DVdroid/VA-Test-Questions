//
//  FraudulentActivityNotification.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 12/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class FraudulentActivityNotification {

    class func activityNotifications(expenditure: [Int], d: Int) -> Int {

        if expenditure.count < d {
            return 0
        }

        //[1, 2, 3, 4, 4]
        var fireNotification = 0
        let sortedExpenditure = expenditure.sorted()
        for index in d..<sortedExpenditure.count {
            let medianArray = Array(sortedExpenditure[(index - d)...(index-1)])

            var median: Float = 0.0
            let middleIndex = d / 2
            if d % 2 == 0 {
                median = Float((medianArray[middleIndex - 1] + medianArray[middleIndex])) / 2.0
            } else {
                median = Float(medianArray[middleIndex])
            }

            print(medianArray, median)
            if Float(expenditure[index]) >= (median * 2.0) {
                fireNotification += 1
            }
        }

        return fireNotification
    }
}
