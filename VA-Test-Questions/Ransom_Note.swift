//
//  Ransom_Note.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 07/05/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class Ransome_Note {

    class func checkMagazine(magazine: [String], note: [String]) -> Void {

        var noteWordCount: [String: Int] = [:]
        var magazineWordCount: [String: Int] = [:]

        for word in note {
            let key = noteWordCount[word]
            if key == nil {
                noteWordCount[word] = 1
            } else {
                noteWordCount[word]? += 1
            }
        }

        for word in magazine {
            let key = magazineWordCount[word]
            if key == nil {
                magazineWordCount[word] = 1
            } else {
                magazineWordCount[word]? += 1
            }
        }

        for (key, value) in noteWordCount {
            guard let count = magazineWordCount[key] else { print("No"); return }
            if count < value{
                print("No")
                return
            }
        }

        print("Yes")
    }
}
