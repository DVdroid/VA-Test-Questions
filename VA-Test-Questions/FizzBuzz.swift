//
//  FizzBuzz.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 26/04/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

final class FizzBuzz {

    /*
     Write a program that prints the numbers from 1 to 100.
     But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”.
     For numbers which are multiples of both three and five print “FizzBuzz”
     */

    func isPrime(number: Int) -> Bool {

        if number == 2 { return true }
        for currentNumber in 2...(number - 1) {
            if number % currentNumber == 0 {
                return false
            }
        }
        return true
    }

    func printNumbersUsingIfElse() {

        for number in 2...100 {

            if (number % 3 == 0 && number % 5 == 0) {
                isPrime(number: number) ? print ("FizzBuzz Prime") : print ("FizzBuzz")
            }
            else if (number % 3 == 0) {
                isPrime(number: number) ? print ("Fizz Prime") : print ("Fizz")
            } else if (number % 5 == 0) {
                isPrime(number: number) ?  print ("Buzz Prime") : print ("Buzz")
            } else {
                isPrime(number: number) ? print("\(number) Prime") : print(number)
            }
        }
    }

    func printNumbersUsingSwitch() {

        for number in 2...100 {

            switch (number % 3 == 0, number % 5 == 0, isPrime(number: number)) {
            case (true, true, true):
                print ("FizzBuzz Prime")
            case (true, true, false):
                print ("FizzBuzz")
            case (true, false, true):
                print ("Fizz Prime")
            case (true, false, false):
                print ("Fizz")
            case (false, true, true):
                print ("Buzz Prime")
            case (false, true, false):
                print ("Buzz")
            case (false, false, true):
                print("\(number) Prime")
            default:
                print(number)
            }
        }
    }


    lazy var fizzBuzz: (Int) -> String = { number in

        switch (number % 3 == 0, number % 5 == 0, self.isPrime(number: number)) {
        case (true, true, true):
            return "FizzBuzz Prime"
        case (true, true, false):
            return "FizzBuzz"
        case (true, false, true):
            return "Fizz Prime"
        case (true, false, false):
            return "Fizz"
        case (false, true, true):
            return "Buzz Prime"
        case (false, true, false):
            return "Buzz"
        case (false, false, true):
            return "\(number) Prime"
        default:
            return "\(number)"
        }
    }

    func printNumbersUsingMap() {
        print(Array(2...100).map(fizzBuzz).joined(separator: ", "))
    }

}
