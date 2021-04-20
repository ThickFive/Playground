/*	FILEPATH = "./Base/is_object_of_class.swift"
 *	Is Object Of Class
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
    //  let obj = Class()
    let obj: AnyObject = Class()
    if obj is Class {
        print("obj is object of Class")
    }
}