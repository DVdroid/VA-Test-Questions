//
//  DynamicArray.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 01/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation
import simd
/*
 Problem
 Create a list of N empty sequences - N is input
 Perform following operations on the above sequence
 The 2 types of queries that can be performed on your list of sequences () are described below:
 Query: 1 x y
 Find the sequence, seq, at index ((x^lastElement) % N) in seqList.
 Append integer y to sequence seq.
 Query: 2 x y
 Find the sequence, seq, at index ((x^lastElement) % N) in seqList.
 Find the value of element  (y % size) in seq (where size is the size of seq) and assign it to lastAnswer.
 Print the new value lastAnswer of  on a new line
 */
final class DynamicArray {

    class func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
        // Write your code here

        var seqList = Array<[Int]>(repeating: [], count: n)
        var printArray: [Int] = []
        var lastAnswer = 0

        for query in queries {
            let queryType = query[0]
            let x = query[1]
            let y = query[2]

            let seqNumber = ((x^lastAnswer) % n)
            if queryType == 1 {
                seqList[seqNumber].append(y)
            } else {
                let seq = seqList[seqNumber]
                let index = y % seq.count
                lastAnswer = seq[index]
                printArray.append(lastAnswer)
            }
        }
        //print(printArray)
        return printArray
    }

   class func dynamicArrayUsingRecursion(n: Int, queries: [[Int]]) -> [Int] {
        // Write your code here
        var seqList: [Int: [Int]] = [:]
        var printArray: [Int] = []
        var lastAnswer = 0
        let startIndex = 0

        func process(queries: [[Int]], for startIndex: Int) {

            let query = queries[startIndex]
            let queryType = query[0]
            let x = query[1]
            let y = query[2]

            let seqKey = ((x^lastAnswer) % n)
            if queryType == 1 {
                if seqList[seqKey] == nil {
                    seqList[seqKey] = [y]
                } else {
                    seqList[seqKey]?.append(y)
                }
            } else {
                guard let seq = seqList[seqKey] else { return }
                lastAnswer = seq[y % seq.count]
                printArray.append(lastAnswer)
            }

            if startIndex < (queries.count - 1) {
                process(queries: queries, for: (startIndex + 1))
            }
        }

        process(queries: queries, for: startIndex)
        //print(printArray)
        return printArray
    }
}
