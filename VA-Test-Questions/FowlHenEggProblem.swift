//
//  FowlHenEggProblem.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 17/10/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import Foundation

public enum Identifier {
    static let dinosaurIdentifier: String = "Dinosaur"
    static let henIdentifier: String = "Hen"
}

public enum AlreadyHatchedError: Error {
    case alreadyHatched
}

public protocol Fowl {
    associatedtype FowlType: Fowl
    var identifier: String { get }
    func lay() -> Egg<FowlType>
}

public class Dinosaur: Fowl {

    public typealias FowlType = Dinosaur

    public var identifier: String {
        return Identifier.dinosaurIdentifier
    }

    public func lay() -> Egg<FowlType> {
        return Egg.init(createFowl: {
            return FowlType()
        })
    }
}

public class Hen: Fowl {

    public typealias FowlType = Hen

    public var identifier: String {
        return Identifier.henIdentifier
    }

    public func lay() -> Egg<FowlType> {
        return Egg.init(createFowl: {
            return FowlType()
        })
    }
}

public class Egg<T> {

    var isAlreadyHatched: Bool = false
    let fowl: (() -> T)

    public init(createFowl: @escaping () -> T) {
        self.fowl = createFowl
    }

    public func hatch() throws -> T {
        if isAlreadyHatched {
            throw AlreadyHatchedError.alreadyHatched
        } else {
            isAlreadyHatched = true
            return self.fowl()
        }
    }
}
