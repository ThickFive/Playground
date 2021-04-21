/*	FILEPATH = "./LeetCode/250/242_valid_anagram.swift"
 *	242. Valid Anagram
	Given two strings s and t, return true if t is an anagram of s, and false otherwise.

	Example 1:
	Input: s = "anagram", t = "nagaram"
	Output: true

	Example 2:
	Input: s = "rat", t = "car"
	Output: false

	Constraints:
		1 <= s.length, t.length <= 5 * 104
		s and t consist of lowercase English letters.
	Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 */

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var map_s: [Character: Int] = [:]
        var map_t: [Character: Int] = [:]
        for c in s {
            if let count = map_s[c] {
                map_s[c] = 1 + count
            } else {
                map_s[c] = 1
            }
        }
        for c in t {
            if let count = map_t[c] {
                map_t[c] = 1 + count
            } else {
                map_t[c] = 1
            }
        }
        for (key, val) in map_s {
            if val != map_t[key] {
                return false
            }
        }
        return true
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
    print(Solution().isAnagram("anagram", "nagaram"))
    print(Solution().isAnagram("rat", "car"))
}