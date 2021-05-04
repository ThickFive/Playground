/*	FILEPATH = "./LeetCode/50/28_implement_strstr().swift"
 *	28. Implement strStr()
	Implement strStr().
	Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
	Clarification:
	What should we return when needle is an empty string? This is a great question to ask during an interview.
	For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

	Example 1:
	Input: haystack = "hello", needle = "ll"
	Output: 2

	Example 2:
	Input: haystack = "aaaaa", needle = "bba"
	Output: -1

	Example 3:
	Input: haystack = "", needle = ""
	Output: 0

	Constraints:
		0 <= haystack.length, needle.length <= 5 * 10^4
		haystack and needle consist of only lower-case English characters.
 */

class Solution0 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
		if haystack.count < needle.count {
			return -1
		}
		let chars1 = Array(haystack)
		let chars2 = Array(needle)
		for i in 0..<chars1.count-chars2.count+1 {
			var count = 0
			for j in 0..<chars2.count {
				if chars1[i+j] != chars2[j] {
					break
				}
				count += 1
			}
			if count == chars2.count {
				return i
			} else {
				continue
			}
		}
        return -1
    }
}

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        return match(haystack, needle)
    }
    
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
    print(Solution().strStr("hello", "ll"))
	print(Solution().strStr("aaaaa", "bba"))
	print(Solution().strStr("", ""))
}