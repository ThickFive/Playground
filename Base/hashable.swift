/*	FILEPATH = "./Base/hashable.swift"
 *	Hashable
    Protocol:   Hashable, https://github.com/apple/swift/blob/main/stdlib/public/core/Hashable.swift
    required:   static func ==(lhs: Self, rhs: Self) -> Bool
                func hash(into hasher: inout Hasher)
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

    //  @required
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

Test.run {
    var dict: [AnyHashable: Any] = [:]
    let key = HashableKey()
    dict[key] = "key is HashableKey"
    print(dict)
}