//
//  StingsHasAllSubStringChars.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 19/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

class StringHasAllSubStringChars {

    class func checkChars_new(fromString note: String, in book: String) -> Bool {
        //O(m)
        var bookUpperCased = book.uppercased()

        //O(n)
        for char in note {
            if let range = bookUpperCased.range(of: char.uppercased()) {
                bookUpperCased.removeSubrange(range)
            }
        }
        return bookUpperCased.count + note.count == book.count
    }

    class func checkChars(fromString note: String, in book: String) -> Bool {
        var noteDict = [Character: Int]()
        for char in note {
            if let value = noteDict[char] {
                noteDict[char] = value + 1
            } else {
                noteDict[char] = 1
            }
        }

        for char in book {
            if var value = noteDict[char], value > 0 {
                value = value - 1
                noteDict[char] = value
                if value == 0  {
                    noteDict.removeValue(forKey: char)
                    if noteDict.isEmpty {
                        return true
                    }
                }
            }
        }
        return false
    }
}
