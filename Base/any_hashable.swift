/*	FILEPATH = "./Base/any_hashable.swift"
 *	AnyHashable
    Struct:   AnyHashable, https://github.com/apple/swift/blob/main/stdlib/public/core/AnyHashable.swift
    A type-erased hashable value.
    public struct AnyHashable: Hashable {
        ...
    }
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

class HashableKey: Hashable {
    //  @required, Hashable: Equatable
    static func ==(lhs: HashableKey, rhs: HashableKey) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class NotHashable {

}

Test.run {
    var dict: [AnyHashable: Any] = [:]
    dict["a"] = "key is string `a`"
    dict[1] = "key is int `1`"
    dict[false] = "key is bool `false`"
    dict[HashableKey()] = "key is HashableKey"
    print(dict)

    let any: AnyHashable = AnyHashable(1)
    print(_convertToAnyHashable(any))
    let key: AnyHashable = HashableKey()
    print(_convertToAnyHashable(key))
    //  error: global function '_convertToAnyHashable' requires that 'NotHashable' conform to 'Hashable'
    //  let not = NotHashable()
    //  print(_convertToAnyHashable(not))
}