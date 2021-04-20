/*	FILEPATH = "./Base/is_class_of_metaclass.swift"
 *	Is Class Of MetaClass
    use `is`, e.g. if obj is Class {...}
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
    let cls: AnyClass = Class.self
    if cls is Class.type {
        print("cls is class of Class.type")
    }
}