/*	FILEPATH = "./Base/equatable.swift"
 *  Equatable	
    Protocol:   Equatable, https://github.com/apple/swift/blob/main/stdlib/public/core/Equatable.swift
    required:   static func ==(lhs: Self, rhs: Self) -> Bool
    optional:   static func !=(lhs: Self, rhs: Self) -> Bool
                static func ===(lhs: AnyObject?, rhs: AnyObject?) -> Bool
                static func !==(lhs: AnyObject?, rhs: AnyObject?) -> Bool
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

class Class: Equatable {
    var val: Int

    init(_ val: Int) {
        self.val = val
    }

    //  @required
    static func ==(lhs: Class, rhs: Class) -> Bool {
        return lhs.val == rhs.val
    }

    //  @optional
    static func !=(lhs: Class, rhs: Class) -> Bool {
        return !(lhs == rhs)
    }

    static func ===(lhs:Class, rhs: Class) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    static func !==(lhs: Class, rhs: Class) -> Bool {
        return !(lhs === rhs)
    }
}

Test.run {
    let lhs = Class(10)
    let rhs = Class(10)
    print(lhs == rhs)
    print(lhs != rhs)
    print(lhs === rhs)
    print(lhs !== rhs)
}