/*	FILEPATH = "./Base/class_for_object.swift"
 *	Class For Object
    use `type(of: AnyObject)`, e.g. let cls = type(of: obj)
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
    //  let cls = obj.dynamicType
    //  error: '.dynamicType' is deprecated. Use 'type(of: ...)' instead
    let obj = Class()
    let cls = type(of: obj)
    print(cls)
}