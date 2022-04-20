//
//  TurnstileProblem.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 17/10/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

enum TurnstileAction {
    case notUsed
    case entered
    case exited
}

final class TurnstileProblem {

    //override func viewDidLoad() {
    //super.viewDidLoad()
    // Do any additional setup after loading the view.
    //print(getTimes(time: [0, 0, 1, 5], direction: [0, 1, 1, 0]))
    //print(getTimes(time: [0, 1, 1, 3, 3], direction: [0, 1, 0, 0, 1]))
    //print(getTimes(time: [3, 3, 3, 4, 4, 5, 6, 6, 7, 8], direction: [1, 1, 0, 1, 0, 0, 0, 1, 0, 0]))
    //print(getDayOfWeek("11-December-2000") ?? 0)
    //}

    func old_getTimes(time: [Int], direction: [Int]) -> [Int] {

        var inQueue = QueueArray<Int>()
        var outQueue = QueueArray<Int>()
        var currentIndex = 0
        var resultTime: [Int] = .init(repeating: -1, count: time.count)
        var perviousSecondTurnStileAction: TurnstileAction = .notUsed

        guard let startSecond:Int = time.first, let endSecond:Int = time.last else { return [] }
        for second in startSecond...endSecond {
            while time[currentIndex] == second {

                if direction[currentIndex] == 0 {
                    inQueue.enqueue(currentIndex)
                } else {
                    outQueue.enqueue(currentIndex)
                }

                currentIndex += 1
            }

            switch (inQueue.isEmpty, outQueue.isEmpty) {

            case (true, true):
                perviousSecondTurnStileAction = .notUsed
                continue

            case (false, false):

                switch perviousSecondTurnStileAction {
                case .notUsed:
                    if let next = outQueue.dequeue() {
                        resultTime[next] = second
                        perviousSecondTurnStileAction = .exited
                    }
                case .entered:
                    if let next = inQueue.dequeue() {
                        resultTime[next] = second
                        perviousSecondTurnStileAction = .entered
                    }
                case .exited:
                    if let next = outQueue.dequeue() {
                        resultTime[next] = second
                        perviousSecondTurnStileAction = .exited
                    }
                }

            case (true, false):
                if let next = outQueue.dequeue() {
                    resultTime[next] = second
                    perviousSecondTurnStileAction = .exited
                }

            case (false, true):
                if let next = inQueue.dequeue() {
                    resultTime[next] = second
                    perviousSecondTurnStileAction = .entered
                }
            }
        }

        var newTime = endSecond
        if !inQueue.isEmpty {
            for _ in 0..<inQueue.length {
                if let next = inQueue.dequeue() {
                    resultTime[next] = newTime + 1
                    newTime += 1
                }
            }
        }

        if !outQueue.isEmpty {
            for _ in 0..<outQueue.length {
                if let next = outQueue.dequeue() {
                    resultTime[next] = newTime + 1
                    newTime += 1
                }
            }
        }

        return resultTime
    }

    func getTimes(time: [Int], direction: [Int]) -> [Int] {

        var inQueue = QueueArray<Int>()
        var outQueue = QueueArray<Int>()
        var perviousSecondTurnStileAction: TurnstileAction = .notUsed

        var t = time.first!
        for index in 0..<time.count {
            inQueue.enqueue(index, atIndex: direction[index])

            while t < time[index + 1] {

                if !inQueue.isEmpty, perviousSecondTurnStileAction != .exited {

                    let frontElement = inQueue.peek!
                    t += 1
                    outQueue[frontElement] = t
                    inQueue.dequeue()
                    perviousSecondTurnStileAction = .entered

                } else if (!outQueue.isEmpty) {

                    let frontElement = inQueue.peek!
                    t += 1
                    outQueue[frontElement] = t
                    inQueue.dequeue()
                    perviousSecondTurnStileAction = .exited

                } else if (!inQueue.isEmpty) {

                    let frontElement = inQueue.peek!
                    t += 1
                    outQueue[frontElement] = t
                    inQueue.dequeue()
                    perviousSecondTurnStileAction = .entered

                } else {
                    t = time[index + 1]
                    perviousSecondTurnStileAction = .notUsed
                }
            }
        }

        return outQueue.elements
    }
}
