//
//  NewYearChaos.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 06/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

//Incomplete
final class NewYearChaos {

    class func minimumBribes(q: [Int]) -> Void {

        var totalSwapDone = 0
        for (index, _) in q.enumerated() {
            if q[index] > (index + 1)  {
                let diff = q[index] - (index + 1)
                if diff > 2 {
                    print("Too chaotic")
                    return
                } else {
                    totalSwapDone += diff
                }
            }
        }
        print(totalSwapDone)
    }
}
