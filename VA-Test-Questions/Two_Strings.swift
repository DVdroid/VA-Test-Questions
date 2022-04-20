//
//  Two_Strings.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 07/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class Two_Strings {

    class func twoStrings(s1: String, s2: String) -> String {

        var string1CharacterCount: [Character: Int] = [:]

        for character in s1 {
            let key = string1CharacterCount[character]
            if key == nil {
                string1CharacterCount[character] = 1
            } else {
                string1CharacterCount[character]? += 1
            }
        }


        for character in s2 {
            if string1CharacterCount[character] != nil {
                return "YES"
            }
        }

        return "NO"
    }
}
