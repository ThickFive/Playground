/*	FILEPATH = "./Base/address_of_any_object.swift"
 *	Address Of Any Object
    https://github.com/apple/swift/blob/main/stdlib/public/core/ObjectIdentifier.swift
    public struct ObjectIdentifier: Sendable, Equatable, Comparable, Hashable {
        ...
    } 
    ObjectIdentifier(AnyObject)
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

class Class {

}

Test.run {
    let obj1 = Class()
    let obj2 = Class()
    let ads1 = ObjectIdentifier(obj1)
    let ads2 = ObjectIdentifier(obj2)
    print("Address", ads1, ads2)
    print("Equatable", ads1 == ads2)
    print("Equatable", ads1 != ads2)
    print("Comparable", ads1 < ads2)
    print("Comparable", ads1 > ads2)
    print("Comparable", ads1 <= ads2)
    print("Comparable", ads1 >= ads2)
    print("Hashable", ads1.hashValue)
}