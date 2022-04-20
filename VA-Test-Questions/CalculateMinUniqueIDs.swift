//
//  CalculateMinUniqueIDs.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 26/04/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class CalculateMinUniqueIDs {

    let inputArray = [1, 1, 1, 2, 2, 3]
    let maxItemRemoveCount = 2

    /*
     1- Count the occurrence of elements and store in the dictionary.
     2- Sort the dictionary.
     3- Start removing elements from dictionary.
     4- Return the number of values left in the dictionary.
     */

    func findMinimunDistictIds(input: [Int], itemRemovalAttempt: Int) -> Int {

        var itemDeletionCounter = 0
        var itemRemovalAttempt = itemRemovalAttempt
        let uniqueElements = findUniqueElementsWithCount(in: input)

        //Size is the number of unique elements in the dictionary
        let size = uniqueElements.keys.count

        //Sorting dictionary by value - Return a tuple i.e. item.key and item.value
        let sortedUniqueElements = uniqueElements.sorted(by: { $0.value < $1.value } )

        //Start deleting the element with least occurance count
        for item in sortedUniqueElements {

            //item occurance count is less than equal to number of items to be removed then
            // Decrease "number of items to be removed" count
            // Increase "number of items deleted" count
            if item.value <= itemRemovalAttempt {
                itemRemovalAttempt -= item.value
                itemDeletionCounter += 1
            }
            else {

                //Return the "number of unique element" - "number of items deleted" count
                return size - itemDeletionCounter
            }
        }

        //Return the "number of unique element" - "number of items deleted" count
        return size - itemDeletionCounter
    }


    func findUniqueElementsWithCount(in input: [Int]) -> [Int: Int] {

        var uniqueElements: [Int: Int] = [:]
        for number in input {
            if let count = uniqueElements[number] {
                uniqueElements[number] = count + 1
            } else {
                uniqueElements[number] = 1
            }
        }
        return uniqueElements
    }
}
