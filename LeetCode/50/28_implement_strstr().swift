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
		0 <= haystack.length, needle.length <= 5 * 104
		haystack and needle consist of only lower-case English characters.
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
		if haystack.count < needle.count {
			return -1
		}
		let chars1 = characters(haystack)
		let chars2 = characters(needle)
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

	func characters(_ string: String) -> [Character] {
		var chars: [Character] = []
		for c in string {
			chars.append(c)
		}
		return chars
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