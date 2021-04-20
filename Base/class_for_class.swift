/*	FILEPATH = "./Base/class_for_class.swift"
 *	Class For Class
    use `Class.self`, e.g. let cls = Class.self
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
    let cls = Class.self
    print(cls)
}