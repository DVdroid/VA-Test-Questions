//
//  IndexPairInArrayForAGivenSum.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 20/04/22.
//  Copyright © 2022 Vikash Anand. All rights reserved.
//

import Foundation

final class IndexPairInArrayForAGivenSum {
    
    func findIndexOfPair(withSum sum: Int, in array: [Int]) throws -> (Int, Int)? {
        
        var diffDictionary = [Int: Int]()
        var result: (Int, Int)? = nil
        
        for (index, value) in values.enumerated() {
            let diff = sum - value
            if let storedIndex = diffDictionary[diff] {
                result = (index, storedIndex)
            } else {
                diffDictionary[value] = index
            }
        }
        
        if result == nil {
            throw MyError.notFound
        }
        
        return result
    }
}

