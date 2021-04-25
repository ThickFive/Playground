/*	FILEPATH = "./Base/kmp.swift"
 *	Knuth-Morris-Pratt 
 */

func match(_ s: String, _ p: String) -> Bool {
    let s = Array(s)
    let p = Array(p)
    let next = get_next(p)
    var len = 0 //  相同字符长度
    var i = 0
    var j = 0
    while i < s.count && j < p.count {
        if s[i] == p[j] {
            len += 1
            if len == p.count {
                return true
            }
        } else {
            len = next[len]
            j = len - 1
        }
        j += 1
        i += 1
    }
    return false
}

func get_next(_ s: [Character]) -> [Int] {
    var next = Array(repeating: 0, count: s.count)
    for i in 1..<s.count {
        if s[i] == s[next[i - 1]] {
            next[i] = next[i - 1] + 1
        } else {
            next[i] = s[i] == s[0] ? 1 : 0
        }
    }
    return next
}

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
    print(match("123125", "124"))
    print(match("123125", "312"))
    print(match("111", "111"))
    print(match("a", "a"))
    print(match("a", "b"))
    print(match("1111111b1111111c1111111d1111111e1111111f1111111g", "1111111a"))
    print(match("1111111b1111111c1111111d1111111e1111111f1111111g", "1111111g"))
}
