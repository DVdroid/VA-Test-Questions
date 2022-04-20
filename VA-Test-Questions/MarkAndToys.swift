//
//  MarkAndToys.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 12/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class MarkAndToys {

    class func maximumToys(prices: [Int], k: Int) -> Int {

        let filterPrices = prices.filter { $0 <= k }
        let sortedPrices = filterPrices.sorted()

        var toysCount = 0
        var toysPrice = 0
        for price in sortedPrices {
            toysPrice += price
            if toysPrice > k {
                return toysCount
            }
            toysCount += 1
        }

        return toysCount
    }

}
