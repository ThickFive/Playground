/*	FILEPATH = "./Base/comparable.swift"
 *	Comparable
    Protocol:   Comparable, https://github.com/apple/swift/blob/main/stdlib/public/core/Comparable.swift
    required:   static func ==(lhs: Class, rhs: Class) -> Bool
                static func <(lhs: Self, rhs: Self) -> Bool
    optional:   static func <=(lhs: Self, rhs: Self) -> Bool
                static func >(lhs: Self, rhs:Self) -> Bool
                static func >=(lhs: Self, rhs: Self) -> Bool
 */

/*
 *  TEST
 */
import Foundation
class Test {
    class func run(_ code:() -> ()) {
        let start = Date()
        print("\(start): Test start")
        code()
        let end = Date()
        print("\(end): Test end in \(Int((end.timeIntervalSince1970 - start.timeIntervalSince1970)*1000))ms")
    }
}

class Class: Comparable {
    var val: Int

    init(_ val: Int) {
        self.val = val
    }

    //  @required, Comparable: Equatable
    static func ==(lhs: Class, rhs: Class) -> Bool {
        return lhs.val == rhs.val
    }

    //  @required
    static func <(lhs: Class, rhs: Class) -> Bool {
        return lhs.val < rhs.val
    }

    //  @optional
    static func >(lhs: Class, rhs: Class) -> Bool {
        return rhs < lhs
    }

    static func <=(lhs: Class, rhs: Class) -> Bool {
        return !(rhs > lhs)
    }

    static func >=(lhs: Class, rhs: Class) -> Bool {
        return !(lhs < rhs)
    }
}

Test.run {
    let obj1 = Class(1)
    let obj2 = Class(2)
    print("Comparable < ", obj1 < obj2)
    print("Comparable <=", obj1 <= obj2)
    print("Comparable > ", obj1 > obj2)
    print("Comparable >=", obj1 >= obj2)
}