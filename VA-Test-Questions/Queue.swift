//
//  Queue.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 16/10/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty:Bool { get }
    var peek:Element? { get }
}

struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init() {}

    var elements: [T] {
        return array
    }

    subscript (index: Int) -> T {
       get {
          return array[index]
       }
       set(newValue) {
          array[index] = newValue
       }
    }

    var isEmpty: Bool {
        return array.isEmpty
    }

    var length: Int {
        return array.count
    }

    var peek: T? {
        return array.first
    }

    @discardableResult mutating func enqueue(_ element: T, atIndex index: Int) -> Bool {
        array.insert(element, at: index)
        return true
    }

    @discardableResult mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }

    @discardableResult mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}


extension QueueArray: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}
