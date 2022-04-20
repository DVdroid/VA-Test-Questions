//
//  StringDecodingCount.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 20/04/22.
//  Copyright © 2022 Vikash Anand. All rights reserved.
//

import Foundation

//Input A->1, B->2, C->3, D->4, E->5
//Input - 12345
//Output - 3
// 1st - ABCDE
// 2nd - LCDE
// 3rd - AWDE

final class StringDecodingCount {
    
    static func decode(_ input: String) -> Int {
        if (input.count == 0 || input.count == 1),
            input[input.startIndex] == "0" { return 0 }
        return decodeHelper(input, length: input.count)
    }
    
    private static func decodeHelper(_ input: String, length: Int) -> Int {
        if length == 0 || length == 1 { return 1 }
        var count:Int = 0
        let nMinusOneIndex = input.index(input.startIndex, offsetBy: (length - 1))
        let nMinusOneCharacter = input[nMinusOneIndex]
        if  nMinusOneCharacter > "0" {
            count = decodeHelper(input, length: (length - 1))
        }
        
        let nMinusTwoIndex = input.index(before: nMinusOneIndex)
        let nMinusTwoCharacter = input[nMinusTwoIndex]
        if (nMinusTwoCharacter == "1" || nMinusTwoCharacter == "2"), input[nMinusOneIndex] < "7" {
            count += decodeHelper(input, length: (length - 2))
        }
        return count
    }
}
