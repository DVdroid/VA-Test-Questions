//
//  SockMerchant.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 04/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class SockMerchant {

    class func findPairCount(in ar: [Int]) -> Int {

        var sockPairs: [Int: Int] = [:]
        for sock in ar {
            if sockPairs[sock] != nil {
                sockPairs[sock]? += 1
            } else {
                sockPairs[sock] = 1
            }
        }

        var totalPairCount = 0
        for pairCount in sockPairs.values {
            totalPairCount += (pairCount / 2)
        }
        return totalPairCount
    }
}
