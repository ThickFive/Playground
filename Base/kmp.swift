/*	FILEPATH = "./Base/kmp.swift"
 *	Knuth-Morris-Pratt 
    index               [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]     
    pattern             [ a, b, a, b, c, a, b, a, b, a, d]
    Partial Match Table [ 0, 0, 1, 2, 0, 1, 2, 3, 4, 3, 0]
    next                [-1, 0, 0, 1, 2, 0, 1, 2, 3, 4, 3, 0]
 */

func match(_ s: String, _ p: String) -> Int {
    let s = Array(s), p = Array(p)
    let next = get_next(p)
    var i = 0, j = 0
    while i < s.count && j < p.count {
        if j == -1 || s[i] == p[j] {
            j += 1
            i += 1
        } else {
            j = next[j]
        }
    }
    return j == p.count ? i - j : -1
}

func get_next(_ p: [Character]) -> [Int] {
    var next = Array(repeating: -1, count: p.count + 1)
    var i = 0, j = -1
    while i < p.count {
        if j == -1 || p[i] == p[j] {
            i += 1
            j += 1
            next[i] = j
        } else {
            j = next[j]
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
    print(match("abc", "edf"))
    print(match("ababcabababcababad", "ababcababad"))
    print(match("123125", "124"))
    print(match("123125", "312"))
    print(match("111", "111"))
    print(match("a", "a"))
    print(match("a", "b"))
    print(match("1111111b1111111c1111111d1111111e1111111f1111111g", "1111111a"))
    print(match("1111111b1111111c1111111d1111111e1111111f1111111g", "1111111g"))
}
