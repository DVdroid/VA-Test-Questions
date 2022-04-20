//
//  CreatePassword.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 26/04/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class CreatePassword {

    /*
     * Complete the 'newPassword' function below.
     *
     * The function is expected to return a STRING.
     * The function accepts following parameters:
     *  1. STRING a
     *  2. STRING b
     */

    func newPassword_1(a: String, b: String) -> String {
        // Write your code here
        var results:[String] = []

        var index = 0
        var inputArray: [String] = []
        for char in b {
            inputArray.append(String(char))
        }

        for char in a {
            let tempChar1 = String(char)
            let tempChar2 = index < inputArray.count ? inputArray[index] : ""
            results.append(tempChar1 + tempChar2)
            index += 1
        }

        if inputArray.count > a.count {
            for index in (a.count)...(inputArray.count - 1) {
                let char = inputArray[index]
                results.append(char)
            }
        }

        return results.joined()
    }

    //Using recursion
    func newPassword_2(string1: String, string2: String) -> String {

        let minimumLength = string1.count < string2.count ? string1.count : string2.count
        var counter = 0
        var newPassword = ""

        func createPartialPassword(string: String, from startIndex: Int, to endIndex: Int) -> String {
            if startIndex > endIndex { return newPassword }
            let currentIndex = string.index(string.startIndex, offsetBy: startIndex)
            newPassword += String(string[currentIndex])
            counter += 1

            let sourceString = counter % 2 == 0 ? string1 : string2
            return createPartialPassword(string: sourceString, from: (counter / 2), to: endIndex)
        }

        newPassword = createPartialPassword(string: string1, from: (counter / 2), to: (minimumLength - 1))

        counter /= 2
        if string1.count > string2.count {
            let range = string1.index(string1.startIndex, offsetBy: counter)..<string1.endIndex
            newPassword.append(contentsOf: string1[range])
        } else {
            let range = string2.index(string2.startIndex, offsetBy: counter)..<string2.endIndex
            newPassword.append(contentsOf: string2[range])
        }

        return newPassword
    }

}
