/*	FILEPATH = 
 *	Manacher 查找最长回文子串 O(n)
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

Test.run {
    print(manacher(""))
    print(manacher("a"))
    print(manacher("abba"))
    print(manacher("abbcccbbd"))
}